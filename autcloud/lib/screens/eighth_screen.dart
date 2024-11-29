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
    switch (selectedScalableType.value) {
      case "Under 10":
        return "Under10";
      case "11 - 50":
        return "Between11And50";
      case "51 - 100":
        return "Between51And100";
      case "101 - 200":
        return "Between101And200";
      case "201 - 500":
        return "Between201And500";
      case "Over 500":
        return "Over500";
    }
    return selectedScalableType.value;
  }
}