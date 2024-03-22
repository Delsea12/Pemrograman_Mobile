import 'package:first_app/style_text.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build (context) {
    return Container(
          // color: const Color.fromARGB(255, 255, 64, 64),
          decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: colors,
            // [ Color.fromARGB(255, 20, 195, 205),
            // Color.fromARGB(255, 70, 140, 202) ]
          ),
          ),
          // const pada center dihapus
          child: Center(
            child: Image.asset(
              'assets/images/dice-images/dice-2.png',
              width: 200,
              ),
            // Text("Hello World!",
            // style: 
            // TextStyle(
            //   color: Colors.black38,
            //   fontSize: 38
            // ),
            ),
          );
  }
}