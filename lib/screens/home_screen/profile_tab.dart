// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:employee_dtr/config/colors.dart';
import 'package:employee_dtr/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  static const id = 'set_photo_screen';

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'PROFILE',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: CustomTheme.materialBlue[900],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: SizedBox(
            width: 45,
            height: 45,
            child: FloatingActionButton(
              heroTag: "logout_button",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              backgroundColor: Colors.white,
              foregroundColor: Color.fromARGB(255, 12, 50, 87),
              mini: false,
              isExtended: true,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                // side: BorderSide(
                //   color: CustomTheme.materialBlue[900]!,
                //   width: 1.5,
                // ),
              ),
              child: const Icon(
                Icons.logout_outlined,
                size: 35,
                weight: 4,
              ),
            ),
          ),
        ),
        // Positioned(
        //   top: 80,
        //   left: 20,
        // child: ,
        // ),

        Positioned(
          top: 250,
          left: 20,
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Employee ID:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 4, 14, 29),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Gender:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 4, 14, 29),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Address:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 4, 14, 29),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Birthdate:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 4, 14, 29),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Marital Status:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 4, 14, 29),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Phone Number:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 4, 14, 29),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
