import 'package:autcloud/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(SecondPage());
      },
      child: Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(
          color: TextColors.title, 
          borderRadius: BorderRadius.circular(15), 
        ),
        child: const Center(
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text("두번째 ㅎ"),),
    );
  }
}