import 'package:autcloud/input_box.dart';
import 'package:autcloud/style.dart';
import 'package:autcloud/submit_button.dart';
import 'package:flutter/material.dart';

class LowerContent extends StatelessWidget {
  const LowerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          const Flexible(
            flex: 1,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Nice to meet you!", 
                      style: TextStyle(fontSize: 18, color: TextColors.subtitle),
                    ),
                    Text(
                      "What's your name?", 
                      style: TextStyle(fontSize: 18, color: TextColors.subtitle),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InputBox(),
                        SubmitButton(),
                      ],
                    )
                  ], 
                )
            ),
          ), 
          Expanded(
            child: Container(color: Colors.white,)
          )
        ]
      )
    );
  }
}