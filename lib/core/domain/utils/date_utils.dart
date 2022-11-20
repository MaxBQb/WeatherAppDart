import 'package:intl/intl.dart';

String unixToDateString(int unix) {
  var dt = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
  var res = DateFormat('dd.MM').format(dt);
  return res;
}

String unixToTimeString(int unix) {
  var dt = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
  var res = DateFormat('HH:mm').format(dt);
  return res;
}
