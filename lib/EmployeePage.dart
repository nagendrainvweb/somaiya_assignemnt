import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:somaya_assignment/creditCardPage.dart';
import 'package:somaya_assignment/employee_provider.dart';
import 'package:somaya_assignment/model/employee_data.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'custom_widget/AppTextFeild.dart';
import 'global.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dobController = TextEditingController();

  String? _firstNameError, _lastNameError, _dobError;

  SfRangeValues _values = SfRangeValues(
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10),
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 21),
  );

  @override
  void initState() {
    super.initState();

    _setData();
  }

  _setData() {
    final employeeProvider =
        Provider.of<EmployeeProvider>(context, listen: false);
    if (employeeProvider.employeeData != null) {
      EmployeeData data = employeeProvider.employeeData!;
      _firstNameController.text = data.firstName!;
      _lastNameController.text = data.lastName!;
      _dobController.text = data.dob!;
      final start = parseTime(data.startTime!);
      final end = parseTime(data.endtime!);

      _values = SfRangeValues(
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
            start.hour),
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
            end.hour),
      );
      setState(() {});
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime currentdate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate:
            DateTime(currentdate.year - 18, currentdate.month, currentdate.day),
        firstDate: DateTime(1960),
        lastDate: DateTime(
            currentdate.year - 18, currentdate.month, currentdate.day + 1));
    if (pickedDate != null) {
      final dob = formattedDeviceDate(pickedDate);
      setState(() {
        _dobController.text = dob;
        _dobError = null;
      });
    }
  }

  Widget _buildTimeAvailability() {
    final now = DateTime.now();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey.shade400, width: 1)),
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          SfRangeSlider(
            min: DateTime(now.year, now.month, now.day, 10, 0, 0),
            max: DateTime(now.year, now.month, now.day, 21, 0, 0),
            values: _values,
            dateIntervalType: DateIntervalType.hours,
            shouldAlwaysShowTooltip: true,
            dateFormat: DateFormat.H(),
            // stepDuration: SliderStepDuration(hours: 1),
            //showLabels: true,
            interval: 1,

            //enableIntervalSelection: true,
            tooltipTextFormatterCallback:
                (dynamic actualValue, String formattedText) {
              return formattedTime(actualValue);
            },
            tooltipShape: SfPaddleTooltipShape(),
            enableTooltip: true,
            onChanged: (SfRangeValues values) {
              setState(() {
                _values = values;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text("Availability:  " +
              formattedTime(_values.start) +
              " - " +
              formattedTime(_values.end)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final employeeProvider =
        Provider.of<EmployeeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CreditCard()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.navigate_next_rounded),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              AppTextField(
                  hintText: "First Name*",
                  controller: _firstNameController,
                  errorText: _firstNameError,
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                  textInputType: TextInputType.name),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                  hintText: "Last Name*",
                  controller: _lastNameController,
                  errorText: _lastNameError,
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                  textInputType: TextInputType.name),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  selectDate(context);
                },
                child: IgnorePointer(
                  child: AppTextField(
                      hintText: "DOB*",
                      controller: _dobController,
                      //enable: false,
                      errorText: _dobError,
                      textInputType: TextInputType.name),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _buildTimeAvailability(),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _firstNameError = _firstNameController.text.isEmpty
                          ? "Please Enter First Name"
                          : null;
                      _lastNameError = _lastNameController.text.isEmpty
                          ? "Please Enter Last Name"
                          : null;
                      _dobError = _dobController.text.isEmpty
                          ? "Please Enter DOB"
                          : null;
                    });
                    if (_firstNameError == null &&
                        _lastNameError == null &&
                        _dobError == null) {
                      employeeProvider.saveData(
                          _firstNameController.text,
                          _lastNameController.text,
                          _dobController.text,
                          formattedTime(_values.start),
                          formattedTime(_values.end));
                    }
                  },
                  child: Text("SAVE"))
            ],
          ),
        ),
      ),
    );
  }
}
