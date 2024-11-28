import 'package:flutter/material.dart';

InputDecoration InputBoxDecoration() {
  return const InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffd4d4d4),
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffd4d4d4)),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    contentPadding: EdgeInsets.all(15),
  );
}
