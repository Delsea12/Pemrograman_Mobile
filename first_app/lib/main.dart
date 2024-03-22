// fungsi utamanya
import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

// runapp harus dipanggil dlm app
// materialapp itu widget untuk membuat ui dlm flutter berbasis konsep material design
// custom widget kalau code sudah banyak dan panjang bisa dibuat class
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
          // jika tidak menambhakan container kita tidak bisa menamabhakan color/bg color
          body: GradientContainer([
        Color.fromARGB(226, 118, 160, 223),
        Color.fromARGB(226, 39, 103, 167)
      ])
          // Container(
          //   // color: const Color.fromARGB(255, 255, 64, 64),
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //     colors: [
          //     Color.fromARGB(255, 20, 195, 205),
          //     Color.fromARGB(255, 70, 140, 202)
          //   ])),
          //   child: const Center(
          //     child: Text("Hello World!",
          //     style: TextStyle(
          //       color: Colors.black38,
          //       fontSize: 38
          //     ),),
          //   ),
          // ),
          ),
    ),
  );
}
