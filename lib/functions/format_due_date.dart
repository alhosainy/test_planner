import 'package:intl/intl.dart';

import '../generated/l10n.dart';

String formatDueDate(DateTime dueDate) {
  final now = DateTime.now().day;
  final difference = dueDate.day - now;
  final dayOfWeek = DateFormat('EEEE').format(dueDate);
  final  locale = Intl.getCurrentLocale();
  if (difference == 0) {
    return S.current.today;
  } else if (difference == 1) {
    return S.current.tomorrow;
  } else if (difference > 1 && difference <= 6) {
    return '${S.current.thiss} $dayOfWeek';
  } else if (difference > 6 && difference <= 13) {
    return locale == 'ar' ? '$dayOfWeek القادم' : 'Next $dayOfWeek';
  } else {
   return '';
  }
}
