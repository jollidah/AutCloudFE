import 'package:autcloud/lower_content.dart';
import 'package:autcloud/upper_content.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String uppterTitle;
  final String upperSubtitle;

  const MainScreen({
    super.key, 
    required this.uppterTitle, 
    required this.upperSubtitle
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: UpperContent("", title: uppterTitle, subtitle: upperSubtitle,),
          ),
          const Expanded(
            child: LowerContent(),
          ),
        ],
      ),
    );
  }
}