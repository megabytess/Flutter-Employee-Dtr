import 'package:employee_dtr/config/colors.dart';
import 'package:employee_dtr/config/fonts.dart';
import 'package:employee_dtr/screens/home_screen.dart';
import 'package:employee_dtr/screens/home_screen/request_form.dart';
import 'package:employee_dtr/screens/splash.dart';

import 'package:flutter/material.dart';

class DTRitecrar extends StatelessWidget {
  const DTRitecrar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EmployeeDTR',
      theme: ThemeData(
        textTheme: CapoyCustomTextTheme.of(context),
        primarySwatch: CustomTheme.materialBlue,
      ),
      // home: const SplashScreen(),
      // home: const RequestForm(),
      home: const HomeScreen(),
    );
  }
}
