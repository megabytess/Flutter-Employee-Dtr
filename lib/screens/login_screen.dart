import 'package:employee_dtr/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: null,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    // create white gradient
                    Color.fromARGB(255, 84, 111, 137),
                    Color.fromARGB(255, 12, 50, 87),
                    Color.fromARGB(255, 10, 45, 78),
                  ],
                  stops: [0.1, 0.5, 1],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: buildFooter(),
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Employee",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color: //get color via hex
                                        Colors.white,
                                    fontSize: 40,
                                  )),
                          TextSpan(
                              text: "DTR",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: //get color via hex
                                        Colors.white,
                                    fontSize: 40,
                                  )),
                        ])),
                        const SizedBox(
                          height: 50,
                        ),
                        buildEmail(emailCon, formKey),
                        const SizedBox(
                          height: 10,
                        ),
                        PasswordField(passCon: passCon),
                        buildLoginBtn(context, formKey, emailCon, passCon),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
class PasswordField extends StatefulWidget {
  final TextEditingController passCon;

  const PasswordField({super.key, required this.passCon});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return buildPassword(widget.passCon, GlobalKey<FormState>(), GlobalKey<FormState>());
  }

 Widget buildPassword(
    TextEditingController passCon, GlobalKey<FormState> formKey, GlobalKey<FormState> globalKey) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Password',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 50,
        child: TextFormField(
          controller: passCon,
          obscureText: !_isVisible,
          // ignore: prefer_const_constructors
          style:  TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            suffixIcon: IconButton(onPressed: (){
              setState(() {
                _isVisible = !_isVisible;
              });
            }, icon: _isVisible ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 14),
            prefixIcon: const Icon(
              Icons.lock,
              color: Color.fromARGB(255, 10, 45, 78),
            ),
            hintText: 'Password',
            hintStyle: const TextStyle(color: Colors.black38),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password.';
            } else if (value.length < 8) {
              return 'Password must be at least 8 characters long.';
            }
            return null;
          },
        ),
      )
    ],
  );
}
}

Widget buildEmail(
    TextEditingController emailCon, GlobalKey<FormState> formKey) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Username',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 50,
        child: TextFormField(
          controller: emailCon,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 10, 45, 78),
            ),
            hintText: 'Username',
            hintStyle: TextStyle(color: Colors.black38),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email address or username.';
            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value) &&
                !RegExp(r'^[a-zA-Z0-9_-]{3,16}$').hasMatch(value)) {
              return 'Please enter a valid email address or username.';
            }
            return null;
          },
        ),
      )
    ],
  );
}




Widget buildLoginBtn(BuildContext context, GlobalKey<FormState> formKey,
    TextEditingController emailCon, TextEditingController passCon) {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            // Check if the entered email and password match the hardcoded values
            if ((emailCon.text == 'username') && passCon.text == 'password') {
              // Navigate to the home screen if the credentials are correct
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            } else {
              // Show an error message if the credentials are incorrect
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Invalid email or password')),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Color.fromARGB(255, 10, 45, 78),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ));
}

Widget buildFooter() {
  return Container(
    padding: const EdgeInsets.all(0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'powered by',
          style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 3,
        ),
        SvgPicture.asset(
          'assets/images/kumosoft-logo.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          height: 40,
          width: 50,
        )
      ],
    ),
  );
}
