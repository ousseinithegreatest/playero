import 'package:flutter/material.dart';

class Bar extends AppBar {
  final String data;

  Bar({super.key, required this.data})
      : super(
            title: Text(data,
                style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 25,
                    fontWeight: FontWeight.w500)),
            centerTitle: true,
            elevation: 3);
}
