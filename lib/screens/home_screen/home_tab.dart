import 'package:employee_dtr/app.dart';
import 'package:employee_dtr/config/colors.dart';
import 'package:employee_dtr/screens/home_screen/history_tab.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // create a function that returns the current time
  String getHourMin() {
    var now = DateTime.now();
    return DateFormat("hh:mm").format(now);
  }

  String getAMPM() {
    var now = DateTime.now();
    return " ${DateFormat("aa").format(now)}";
  }

  String getSecs() {
    var now = DateTime.now();
    return DateFormat("ss").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 3,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              //select darker variant of the primary swatch
              color: CustomTheme.materialBlue[700],
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(75)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 45,
                  child: Text("TODAY",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          letterSpacing: 5)),
                ),
                SizedBox(
                  height: 80,
                  child: TimerBuilder.periodic(const Duration(seconds: 1),
                      builder: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 80,
                          child: Text(
                            getHourMin(),
                            style: const TextStyle(
                              color: Colors.white,
                              height: 1.3,
                              fontSize: 70,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900,
                              letterSpacing: 6,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                getAMPM(),
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 3,
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: Text(
                                  ":${getSecs()}",
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: TimerBuilder.periodic(const Duration(seconds: 1),
                      builder: (context) {
                    return Column(
                      children: [
                        Text(
                          DateFormat("MMM d, yyyy").format(DateTime.now()),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 6,
          child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              icon: Icon(
                                Icons.waving_hand,
                                color: Color.fromARGB(255, 2, 18, 36),
                                size: 70,
                              ),
                              title: Text(
                                'You are now clocked in!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(30),
                      backgroundColor: CustomTheme.materialBlue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'TIME IN',
                      style: TextStyle(
                          fontSize: 65,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Center(
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              icon: const Icon(Icons.error_rounded,
                                  color: Colors.red, size: 100),
                              title: const Text(
                                'Wait!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red,
                                ),
                              ),
                              content: const Text(
                                'Are you sure you want to clock out?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 15),
                                        backgroundColor: const Color.fromARGB(
                                            255, 2, 18, 36),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                      ),
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 15),
                                        backgroundColor:
                                            const Color(0xFFFFFFFF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                      ),
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromARGB(255, 2, 18, 36)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 28),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: const BorderSide(
                          color: CustomTheme.materialBlue, width: 2.5),
                    ),
                    child: const Text(' TIME OUT',
                        style: TextStyle(
                          fontSize: 55,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    margin: const EdgeInsets.only(
                        top: 15, bottom: 20, left: 30, right: 200),
                    decoration: BoxDecoration(
                      color: CustomTheme.materialBlue[700],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text('LATEST UPDATE',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          letterSpacing: .5,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
