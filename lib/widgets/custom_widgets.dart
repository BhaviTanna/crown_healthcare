import 'package:flutter/material.dart';

Widget customTextField(
    {required String title,
    required String hintText,
    required TextEditingController controller,
    IconButton? suffixIcon,bool obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey.shade500,
        ),
      ),
      TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: Colors.blueGrey.shade100.withOpacity(0.5),
            filled: true,
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: InputBorder.none),
      ),
    ],
  );
}
