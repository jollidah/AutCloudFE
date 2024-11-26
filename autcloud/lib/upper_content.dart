import 'package:autcloud/style.dart';
import 'package:flutter/material.dart';

class UpperContent extends StatelessWidget {
  final String title;
  final String subtitle;

  const UpperContent(String s, {
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MainColors.yellow,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title, 
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ), 
          Text(
            subtitle, 
            style: TextStyle(fontSize: 25, color: TextColors.subtitle),
          )
        ],
      ),
    );
  }
}