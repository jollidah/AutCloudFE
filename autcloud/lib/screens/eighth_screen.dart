import 'package:autcloud/screens/ninth_screen.dart';
import 'package:autcloud/widgets/dropdown_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Ask Scalable Screen

class EighthScreen extends StatelessWidget {
  EighthScreen({super.key});

  final ScalableTypeDropdownController controller =
      Get.put(ScalableTypeDropdownController());

  final scalableTypeList = [
    "Under 10",
    "11 - 50",
    "51 - 100",
    "101 - 200",
    "201 - 500",
    "Over 500"
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownScreenTemplate(
      title: "How scalable does your service need to be?\nWhat’s your expected RPS at full load?",
      subtitle: "RPS(Request per second)",
      dropdownItems: scalableTypeList,
      selectedValue: controller.selectedScalableType,
      onSubmit: () {
        Get.to(NinthScreen());
      },
      currentPage: 7
    );
  }
}

class ScalableTypeDropdownController extends GetxController {
  var selectedScalableType = ''.obs;

  getScalableType() {
    return selectedScalableType.value;
  }
}