// ignore_for_file: deprecated_member_use

import 'package:logger/logger.dart';

final log = Logger(printer: SimpleLogPrinter());

class SimpleLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    var icon = '';
    switch (event.level) {
      case Level.verbose:
        icon = '🔍';
        break;
      case Level.debug:
        icon = '💡';
        break;
      case Level.info:
        icon = 'ℹ️';
        break;
      case Level.warning:
        icon = '⚠️';
        break;
      case Level.error:
        icon = '❌';
        break;
      case Level.wtf:
        icon = '🤷‍♂️';
        break;
      case Level.all:
        break;
      case Level.trace:
        break;
      case Level.fatal:
        break;
      case Level.nothing:
        break;
      case Level.off:
        break;
    }

    var message = '$icon ${event.message}';

    return [message];
  }
}
