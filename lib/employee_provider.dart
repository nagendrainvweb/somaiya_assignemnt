import 'package:flutter/material.dart';
import 'package:somaya_assignment/database/database_helper.dart';
import 'package:somaya_assignment/global.dart';
import 'package:somaya_assignment/model/employee_data.dart';

class EmployeeProvider extends ChangeNotifier {
  EmployeeData? _employeeData;

  fetchData() async {
    final data = await DatabaseHelper.instance.queryAllRows();
    if (data.isNotEmpty) {
      final json = data[0];
      _employeeData = EmployeeData.fromJson(json);
      notifyListeners();
    }
  }

  EmployeeData? get employeeData => _employeeData;

  void insertData(String firstName, String lastName, String dob,
      String startTime, String endTime) async {
    // insert employee data
    _employeeData = EmployeeData(
        firstName: firstName,
        lastName: lastName,
        dob: dob,
        startTime: startTime,
        endtime: endTime);
    _employeeData!.timeStamp = DateTime.now().millisecondsSinceEpoch.toString();

    print(_employeeData!.toInsertJson().toString());
    final id =
        await DatabaseHelper.instance.insert(_employeeData!.toInsertJson());
    if (id != -1) {
      await fetchData();
      showToast("Data inserted sucessfully");
    }
  }

  void saveData(String firstName, String lastName, String dob, String startTime,
      String endTime) async {
    if (_employeeData == null) {
      insertData(firstName, lastName, dob, startTime, endTime);
    } else {
      updateData(firstName, lastName, dob, startTime, endTime);
    }
  }

  void updateData(String firstName, String lastName, String dob,
      String startTime, String endTime) async {
    // update employee data
    _employeeData!.firstName = firstName;
    _employeeData!.lastName = lastName;
    _employeeData!.dob = dob;
    _employeeData!.startTime = startTime;
    _employeeData!.endtime = endTime;
    _employeeData!.timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    print(_employeeData!.toInsertJson().toString());
     final id = await DatabaseHelper.instance.update(_employeeData!.toUpdateJson());
    if (id != -1) {
      await fetchData();
      showToast("Data updated sucessfully");
    }
  }
}
