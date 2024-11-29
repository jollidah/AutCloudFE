import 'package:autcloud/screens/home_screen.dart';
import 'package:autcloud/screens/third_screen.dart';
import 'package:autcloud/widgets/progress_bar.dart';
import 'package:autcloud/widgets/textinput_submit_button.dart';
import 'package:autcloud/widgets/upper_content.dart';
import 'package:autcloud/widgets/input_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Ask Service Name Screen

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  final NameInputController nameInputController = Get.put(NameInputController());
  final ServiceNameInputController serviceNameInputController = Get.put(ServiceNameInputController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: UpperContent(
              "", 
              title: "Hello, ${nameInputController.nameInput}", 
              subtitle: "What is your service name?",
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 100,),
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
                              serviceNameInputController.updateInput(value);
                            },
                            decoration: InputBoxDecoration(),
                            onSubmitted: (value) {
                              Get.to(ThirdScreen());
                            },
                          ),
                        ),
                        TextinputSubmitButton(onTap: () {
                          Get.to(ThirdScreen());
                        },),
                      ],
                    ),
                  ),
                  // ProgressBarExample(),
                  Expanded(
                    child: ProgressBarExample(currentPage: 1,),
                  )
              ])),
          ),
        ],
      ),
    );
  }
}

// 서비스 이름 입력
class ServiceNameInputController extends GetxController {
  var serviceNameInput = ''.obs;

  void updateInput(String value) {
    serviceNameInput.value = value;
  }

  getServiceName() {
    return serviceNameInput.value;
  }
}