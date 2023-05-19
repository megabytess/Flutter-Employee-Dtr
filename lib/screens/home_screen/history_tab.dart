import 'package:employee_dtr/config/colors.dart';
import 'package:employee_dtr/screens/home_screen/request_form.dart';
import 'package:flutter/material.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  int? selectedMonth;
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

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
                    'HISTORY',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      color: CustomTheme.materialBlue[900],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 180, right: 20, top: 15),
                child: DropdownButtonFormField<int>(
                  isExpanded: true,
                  icon: const Icon(
                    Icons.arrow_drop_down_rounded, 
                    size: 30,
                    color: Color.fromARGB(
                        255, 12, 50, 87), 
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12.0),
                    hintText: 'Select Month',
                    hintStyle: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 12, 50, 87),
                    ),
                  ),
                  value: selectedMonth,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedMonth = newValue;
                    });
                  },
                  items: List<DropdownMenuItem<int>>.generate(
                    months.length,
                    (int index) => DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text(
                        months[index],
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 12, 50, 87),
                        ),
                      ),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RequestForm()),
                );
              },
              backgroundColor: Colors.white,
              foregroundColor: CustomTheme.materialBlue[900]!,
              mini: false,
              isExtended: true,
              elevation: 1,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: const Icon(
                Icons.content_paste_go_outlined,
                size: 35,
                weight: 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
