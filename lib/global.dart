     import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

String formattedDeviceDate(DateTime dateTime) {
    // dateTime = dateTime.add(Duration(hours: 5,minutes: 30));
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

   String pad2(int number) {
    return (number < 10 ? '0' : '') + number.toString();
  }


   String formattedServerDate(DateTime dateTime) {
    // dateTime = dateTime.add(Duration(hours: 5,minutes: 30));
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

   String formattedTime(DateTime dateTime) {
    // dateTime = dateTime.add(Duration(hours: 5,minutes: 30));
    return DateFormat('hh:00 a').format(dateTime);
  }
   DateTime parseTime(String dateTime) {
    // dateTime = dateTime.add(Duration(hours: 5,minutes: 30));
    return DateFormat('hh:00 a').parse(dateTime);
  }

  showToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0
    );
  }
