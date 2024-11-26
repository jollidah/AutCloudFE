import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      width: 200,
      height: 40,
      child: const TextField(
        decoration: InputDecoration(
            // labelText: 'Enter your text', ddd
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffd4d4d4),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffd4d4d4)),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            contentPadding: EdgeInsets.all(15)),
      ),
    );
  }
}
