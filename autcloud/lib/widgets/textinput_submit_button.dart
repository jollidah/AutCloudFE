import 'package:autcloud/style.dart';
import 'package:flutter/material.dart';

class TextinputSubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  
  TextinputSubmitButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 90,
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