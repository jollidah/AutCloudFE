import 'package:autcloud/screens/second_screen.dart';
import 'package:autcloud/style.dart';
import 'package:autcloud/widgets/textinput_submit_button.dart';
import 'package:autcloud/widgets/upper_content.dart';
import 'package:autcloud/widgets/input_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final uptterTitle = "AutCloud";
  final upperSubtitle = "Build infrastructure easily!";

  final NameInputController nameInputController = Get.put(NameInputController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: UpperContent("", title: uptterTitle, subtitle: upperSubtitle,),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: const Column(
                      children: [
                        Text(
                          "Nice to meet you!",
                          style: TextStyle(fontSize: 18, color: TextColors.subtitle),
                        ),
                        Text(
                          "What's your name?",
                          style: TextStyle(fontSize: 18, color: TextColors.subtitle),
                        ),
                      ],
                    ),
                  ),
                  // 텍스트 필드, 버튼
                  Container(
                    margin: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          width: 200,
                          height: 50,
                          child: TextField(
                            onChanged: (value) {
                              nameInputController.updateInput(value);
                            },
                            decoration: InputBoxDecoration(),
                            onSubmitted: (value) {
                              Get.to(SecondScreen());
                            },
                          ),
                        ),
                        TextinputSubmitButton(onTap: (){Get.to(SecondScreen());},),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    )
                  )
              ])),
          ),
        ],
      ),
    );
  }
}


// 이름 입력
class NameInputController extends GetxController {
  var nameInput = ''.obs;

  void updateInput(String value) {
    nameInput.value = value;
  }
}