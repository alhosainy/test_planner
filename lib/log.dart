import 'package:flutter/foundation.dart';

class Log {
  static const topLeftCorner = '┌';
  static const bottomLeftCorner = '└';
  static const middleCorner = '├';
  static const verticalLine = '│';
  static const doubleDivider = '┄';
  static const singleDivider = '┄';

  static void log(String message, {bool isError = false}) {
    if (isError) {
      if (kDebugMode) {
        debugPrint('''
                  $topLeftCorner${doubleDivider * 22}
                  $verticalLine Error info
                  $middleCorner${singleDivider * 22}
                  $verticalLine Method stack history
                  $middleCorner${singleDivider * 22}
                  $verticalLine $message
                  $bottomLeftCorner${doubleDivider * 22}
                  ''');
      }
    } else {
      if (kDebugMode) {
        debugPrint('''
                  $topLeftCorner${doubleDivider * 22}
                  $verticalLine $message
                  $bottomLeftCorner${doubleDivider * 22}
                  ''');
      }
    }
  }
}
