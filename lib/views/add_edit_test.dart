import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../controller/test_bloc/test_bloc.dart';
import '../functions/format_due_date.dart';
import '../functions/show_delete_dialog.dart';
import '../generated/l10n.dart';
import '../models/test_model.dart';

class AddEditTestPage extends StatefulWidget {
  final Test? test;

  const AddEditTestPage({super.key, this.test});

  @override
  State<AddEditTestPage> createState() => _AddEditTestPageState();
}

class _AddEditTestPageState extends State<AddEditTestPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _groupController;
  late DateTime _selectedDate;
  String _selectedClass = S.current.primary1;

  final List<String> _classes = [
    S.current.primary1,
    S.current.primary2,
    S.current.primary3,
    S.current.primary4,
    S.current.primary5,
    S.current.primary6,
    S.current.secondary1,
    S.current.secondary2,
    S.current.secondary3,
    S.current.highSchool1,
    S.current.highSchool2,
    S.current.highSchool3,
  ];

  bool get _isEditing => widget.test != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.test?.name ?? '');
    _groupController =
        TextEditingController(text: widget.test?.groupName ?? '');
    _selectedDate = widget.test?.dueDate ?? DateTime.now();
    _selectedClass = widget.test?.className ?? S.current.primary1;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _groupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? S.current.editTest : S.current.addTest),
        actions: [
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDeleteConfirmationDialog(context, widget.test!);
              },
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: S.current.testName),
              validator: (value) =>
                  value!.isEmpty ? S.current.pleaseEnterTestName : null,
            ),
            TextFormField(
              controller: _groupController,
              decoration: InputDecoration(labelText: S.current.groupName),
              validator: (value) =>
                  value!.isEmpty ? S.current.pleaseEnterGroupName : null,
            ),
            ListTile(
              title: Text(S.current.selectClass),
              subtitle: Text(_selectedClass),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(S.current.selectClass),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: _classes.map((String value) {
                            return ListTile(
                              title: Text(value),
                              onTap: () {
                                setState(() {
                                  _selectedClass = value;
                                });
                                Navigator.of(context).pop();
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: Colors.black54,
            ),
            ListTile(
              title: Text(S.current.dueDate),
              subtitle: Text(
                  '${formatDueDate(_selectedDate)}\t\t${DateFormat('dd / MM / yyyy').format(_selectedDate)}'),
              onTap: () async {
                final local = Intl.getCurrentLocale();
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  locale: Locale(local),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
            ),
            ElevatedButton(
              child:
                  Text(_isEditing ? S.current.updateTest : S.current.addTest),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final test = Test(
                    id: widget.test?.id ?? DateTime.now().toString(),
                    name: _nameController.text,
                    groupName: _groupController.text,
                    dueDate: _selectedDate,
                    isCompleted: widget.test?.isCompleted ?? false,
                    className: _selectedClass,
                  );

                  if (_isEditing) {
                    context.read<TestBloc>().add(UpdateTest(test));
                  } else {
                    context.read<TestBloc>().add(AddTest(test));
                  }

                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
