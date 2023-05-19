import 'package:flutter/material.dart';

class Logo91Watch extends StatelessWidget {
  const Logo91Watch(
      {Key? key,
      required this.fontSize,
      required this.fontWeight,
      required this.isLight})
      : super(key: key);
  final double fontSize;
  final FontWeight fontWeight;
  final bool isLight;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('91',
            style: TextStyle(
                color: isLight == true
                    ? const Color.fromARGB(255, 140, 9, 9)
                    : Colors.white,
                fontWeight: fontWeight,
                fontSize: fontSize)),
        Text('Watch',
            style: TextStyle(
                color: Colors.black,
                fontWeight: fontWeight,
                fontSize: fontSize)),
      ],
    );
  }
}

class Logo91WatchUnverified extends StatelessWidget {
  const Logo91WatchUnverified(
      {Key? key,
      required this.fontSize,
      required this.fontWeight,
      required this.isLight})
      : super(key: key);
  final double fontSize;
  final FontWeight fontWeight;
  final bool isLight;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Logo91Watch(
            fontSize: fontSize, fontWeight: fontWeight, isLight: isLight),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Colors.black,
              Colors.grey,
            ],
          ).createShader(bounds),
          child: Text(
            ' Plus',
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize + 5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Logo91WatchPlus extends StatelessWidget {
  const Logo91WatchPlus(
      {Key? key,
      required this.fontSize,
      required this.fontWeight,
      required this.isLight})
      : super(key: key);
  final double fontSize;
  final FontWeight fontWeight;
  final bool isLight;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Logo91Watch(
            fontSize: fontSize, fontWeight: fontWeight, isLight: isLight),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Colors.orange,
            ],
          ).createShader(bounds),
          child: Text(
            ' Plus',
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize + 5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectMiniCredits extends StatelessWidget {
  const ProjectMiniCredits({Key? key, required this.size}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: const Color.fromARGB(255, 140, 9, 9),
                      fontWeight: FontWeight.bold,
                      fontSize: size),
                  text: '91',
                  children: const [
                    TextSpan(
                      text: 'Watch is a Team F',
                      style:
                          TextStyle(fontFamily: 'Poppins', color: Colors.black),
                    ),
                    TextSpan(
                      text: '2',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromARGB(255, 140, 9, 9),
                      ),
                    ),
                    TextSpan(
                      text: 'P Project',
                      style:
                          TextStyle(fontFamily: 'Poppins', color: Colors.black),
                    ),
                  ]),
            ),
            Text(
              'Carpena • Garces • Gomez',
              style: TextStyle(
                fontSize: size - 2,
              ),
            )
          ],
        ),
      ],
    );
  }
}
