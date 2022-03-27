import 'package:somaya_assignment/database/database_constants.dart';

class EmployeeData {
  int? id;
  String? firstName;
  String? lastName;
  String? dob;
  String? startTime;
  String? endtime;
  String? timeStamp;

  EmployeeData(
      {this.id,
      this.firstName,
      this.lastName,
      this.dob,
      this.startTime,
      this.endtime,
      this.timeStamp});

  EmployeeData.fromJson(Map<String, dynamic> json) {
    id = json[DatabaseConstants.COL_ID];
    firstName = json[DatabaseConstants.COL_FIRST_NAME];
    lastName = json[DatabaseConstants.COL_LAST_NAME];
    dob = json[DatabaseConstants.COL_DOB];
    startTime = json[DatabaseConstants.COL_START_TIME];
    endtime = json[DatabaseConstants.COL_END_TIME];
    timeStamp = json[DatabaseConstants.COL_TIMESTAMP].toString();
  }

  Map<String, dynamic> toInsertJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data[DatabaseConstants.COL_FIRST_NAME] = this.firstName;
    data[DatabaseConstants.COL_LAST_NAME] = this.lastName;
    data[DatabaseConstants.COL_DOB] = this.dob;
    data[DatabaseConstants.COL_START_TIME] = this.startTime;
    data[DatabaseConstants.COL_END_TIME] = this.endtime;
    data[DatabaseConstants.COL_TIMESTAMP] = this.timeStamp;
    return data;
  }
    Map<String, dynamic> toUpdateJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data[DatabaseConstants.COL_ID] = this.id;
    data[DatabaseConstants.COL_FIRST_NAME] = this.firstName;
    data[DatabaseConstants.COL_LAST_NAME] = this.lastName;
    data[DatabaseConstants.COL_DOB] = this.dob;
    data[DatabaseConstants.COL_START_TIME] = this.startTime;
    data[DatabaseConstants.COL_END_TIME] = this.endtime;
    data[DatabaseConstants.COL_TIMESTAMP] = this.timeStamp;
    return data;
  }
}
