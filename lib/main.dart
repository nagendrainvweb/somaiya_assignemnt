import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:provider/provider.dart';
import 'package:somaya_assignment/EmployeePage.dart';
import 'package:somaya_assignment/custom_widget/AppTextFeild.dart';
import 'package:somaya_assignment/employee_provider.dart';

import 'creditCardPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final EmployeeProvider model = EmployeeProvider();
  await model.fetchData();
  runApp( MyApp(
    repo: model,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.repo}) : super(key: key);
  final EmployeeProvider? repo;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<EmployeeProvider>.value(value: repo!)],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const EmployeePage(),
      ),
    );
  }
}
