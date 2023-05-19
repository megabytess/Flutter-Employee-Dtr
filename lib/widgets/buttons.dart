import 'package:flutter/material.dart';

// MaterialButton longButtons(
//     String title, void Function()? fun, Map<dynamic, dynamic> styling ,
//     {Color color = Colors.orange,
//     Color textColor = Colors.white,
//     double textSize = 20.0,
//     height = 60.0,
//     width = double.infinity,
//     bool isBold = false}) {
//   return MaterialButton(
//     onPressed: fun,
//     textColor: textColor,
//     color: color,
//     padding: EdgeInsets.symmetric(vertical: height/2, horizontal: width/2),
//     shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(25))),
//     child: SizedBox(
//       width: width,
//       child: Text(
//         title,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           fontSize: textSize,
//           fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//     ),
//   );
// }

label(String title) => Text(title);

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: const Color.fromRGBO(50, 62, 72, 1.0)),
    // hintText: hintText,
    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}

Widget buildIconWithText(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: const Color.fromRGBO(50, 62, 72, 1.0)),
        const SizedBox(width: 10),
        Text(title),
      ],
    ),
  );
}

InkWell buildSquareButton(
  String title,
  void Function()? fun,
  IconData icon,
  Color? color,
  Color? bodercolor,
  Color? textColor,
  double size,
) {
  return InkWell(
    borderRadius: BorderRadius.circular(15),
    onTap: fun,
    child: Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black.withOpacity(0.1), width: 1),
          borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  color: color,
                  border: Border.all(
                      width: 4, color: bodercolor! // Colors.xxxAccent variant
                      )),
              child: Center(
                child: Icon(icon, color: Colors.white, size: size / 2),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class DrawerButton extends StatelessWidget {
  const DrawerButton(
      {super.key, required this.icon, required this.buttonTitle, this.onTap});

  final Icon icon;
  final String buttonTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 1,
            child: icon,
          ),
          Flexible(
            flex: 9,
            child: Text(
              buttonTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LongButtons extends StatelessWidget {
  LongButtons(
      {super.key,
      required this.title,
      required this.fun,
      this.color = Colors.white,
      this.textColor = Colors.black,
      this.textSize = 20,
      this.height = 60,
      this.width = double.infinity,
      this.isBold = false,
      this.radius = 25});

  final String title;
  final void Function()? fun;
  Color color;
  Color textColor = Colors.white;
  double textSize = 20.0;
  double height;
  double width;
  bool isBold;
  double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
        onPressed: fun,
        textColor: textColor,
        color: color,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: SizedBox(
          width: width,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
