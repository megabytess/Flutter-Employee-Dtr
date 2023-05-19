import 'package:employee_dtr/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestForm extends StatefulWidget {
  const RequestForm({Key? key});

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  final _formKey = GlobalKey<FormState>();
  String _reason = '';
  DateTime _selectedDate = DateTime.now();
  String? _draggedFile;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with form submission
      // Submit the form data to the backend server
      // Handle the API response
      // Update UI accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 12, 50, 87)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const [SizedBox()],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/images/headericon.svg',
          height: 20,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'REQUEST FORM',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: CustomTheme.materialBlue[900],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.grey[200],
                child: DragTarget<String>(
                  onAccept: (file) {
                    setState(() {
                      _draggedFile = file;
                    });
                  },
                  builder: (context, candidateData, rejectedData) {
                    return Center(
                      child: Text(
                        _draggedFile ?? 'Drag and drop file here',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  labelText: 'Reason',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? selected = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selected != null) {
                    setState(() {
                      _selectedDate = selected;
                    });
                  }
                },
                child: const Text('Select Date'),
              ),
              const SizedBox(height: 20),
              Text('Selected Date: ${_selectedDate.toString()}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}// Rest of the code...


             
