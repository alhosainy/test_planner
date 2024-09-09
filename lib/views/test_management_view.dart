import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/test_bloc/test_bloc.dart';
import '../functions/choose_locale_dialog.dart';
import '../generated/l10n.dart';
import '../models/test_model.dart';
import '../widgets/test_list_tile.dart';
import 'add_edit_test.dart';

class TestManagementPage extends StatelessWidget {
  const TestManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => showChooseLocaleDialog(context),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => _showDeleteAllConfirmation(context),
        ),
      ),
      body: BlocBuilder<TestBloc, TestState>(
        builder: (context, state) {
          if (state is TestsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TestsLoaded) {
            final upcomingTests =
                state.tests.where((test) => !test.isCompleted).toList();
            final completedTests =
                state.tests.where((test) => test.isCompleted).toList();
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      S.current.upcomingTests,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        _buildUpcomingTestTile(context, upcomingTests[index]),
                    childCount: upcomingTests.length,
                  ),
                ),
                completedTests.isNotEmpty
                    ? SliverToBoxAdapter(
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          title:  Text(S.current.completedTests),
                          children: [
                            for (final test in completedTests)
                              _buildCompletedTestTile(context, test),
                          ],
                        ),
                      )
                    : const SliverToBoxAdapter(),
              ],
            );
          } else if (state is TestsError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AddEditTestPage()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildUpcomingTestTile(BuildContext context, Test test) {
    return UpcomingTestListTile(
      testName: test.name,
      groupName: test.groupName,
      className: test.className,
      dueDate: test.dueDate,
      onTap: () => _navigateToEditTest(context, test),
      onDelete: () => context.read<TestBloc>().add(DeleteTest(test.id)),
      onComplete: () => context.read<TestBloc>().add(ToggleCompleted(test)),
    );
  }

  Widget _buildCompletedTestTile(BuildContext context, Test test) {
    return CompletedTestListTile(
      testName: test.name,
      groupName: test.groupName,
      className: test.className,
      onTap: () => _navigateToEditTest(context, test),
      onDelete: () => context.read<TestBloc>().add(DeleteTest(test.id)),
      onUndo: () {
        context.read<TestBloc>().add(ToggleCompleted(test));
      },
    );
  }

  void _navigateToEditTest(BuildContext context, Test test) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AddEditTestPage(test: test)),
    );
  }

  void _showDeleteAllConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.current.deleteAllConfirmation),
        content: Text(S.current.deleteAllWarning),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.current.cancel),
          ),
          TextButton(
            onPressed: () {
              context.read<TestBloc>().add(DeleteAllTests());
              Navigator.pop(context);
            },
            child: Text(S.current.delete),
          ),
        ],
      ),
    );
  }
}
