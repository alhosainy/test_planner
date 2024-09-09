import 'package:flutter/material.dart';

import '../functions/format_due_date.dart';
import '../generated/l10n.dart';

class UpcomingTestListTile extends StatelessWidget {
  final String testName;
  final String groupName;
  final String className;
  final DateTime dueDate;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onComplete;

  const UpcomingTestListTile({
    super.key,
    required this.testName,
    required this.groupName,
    required this.className,
    required this.dueDate,
    this.onTap,
    this.onDelete,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final TextDirection currentDirection = Directionality.of(context);
    final bool isRTL = currentDirection == TextDirection.rtl;
    return Dismissible(
      key: Key(testName),
      background: Container(
        color: Colors.green, // Green background for complete action
        alignment: isRTL ? Alignment.centerRight : Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16),
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red, // Red background for delete action
        alignment: isRTL ? Alignment.centerLeft : Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          // Handle delete action
          onDelete?.call();
        } else if (direction == DismissDirection.startToEnd) {
          // Handle complete action
          onComplete?.call();
        }
      },
      child: ListTile(
        title: Text(
          testName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${S.current.group}: $groupName',
                style: const TextStyle(fontSize: 16)),
            Text('${S.current.className}: $className',
                style: const TextStyle(fontSize: 16)),
            Text('${S.current.dueDate}: ${formatDueDate(dueDate)}',
                style: const TextStyle(fontSize: 16)),
          ],
        ),
        trailing: _buildDueDateIndicator(),
        onTap: onTap,
      ),
    );
  }

  Widget _buildDueDateIndicator() {
    final daysUntilDue = dueDate.difference(DateTime.now()).inDays;
    Color indicatorColor;

    if (daysUntilDue <= 1) {
      indicatorColor = Colors.red;
    } else if (daysUntilDue <= 2) {
      indicatorColor = Colors.orange;
    } else {
      indicatorColor = Colors.green;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: indicatorColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$daysUntilDue ${S.current.days}',
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CompletedTestListTile extends StatelessWidget {
  final String testName;
  final String groupName;
  final String className;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onUndo;

  const CompletedTestListTile({
    super.key,
    required this.testName,
    required this.groupName,
    required this.className,
    this.onTap,
    this.onDelete,
    this.onUndo,
  });

  @override
  Widget build(BuildContext context) {
    final TextDirection currentDirection = Directionality.of(context);
    final bool isRTL = currentDirection == TextDirection.rtl;

    return Dismissible(
      key: Key(testName),
      background: Container(
        color: Colors.blue,
        alignment: isRTL ? Alignment.centerRight : Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16),
        child: const Icon(
          Icons.undo,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: isRTL ? Alignment.centerLeft : Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDelete?.call();
        } else if (direction == DismissDirection.startToEnd) {
          onUndo?.call();
        }
      },
      child: ListTile(
        title: Text(
          testName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${S.current.className}: $className',
                style: const TextStyle(
                    fontSize: 16, decoration: TextDecoration.lineThrough)),
            Text('${S.current.group}: $groupName',
                style: const TextStyle(
                    fontSize: 16, decoration: TextDecoration.lineThrough)),
          ],
        ),
        trailing: const Icon(Icons.check_circle, color: Colors.green),
        onTap: onTap,
      ),
    );
  }

  String _formatCompletedDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
