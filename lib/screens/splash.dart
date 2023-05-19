import 'package:employee_dtr/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 50, 87),
      body: Container( 
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Image(
              image: AssetImage("assets/images/splashicon.png"),
              width: 400,
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: SpinKitFoldingCube(
                color: Colors.white,
                size: 60.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}