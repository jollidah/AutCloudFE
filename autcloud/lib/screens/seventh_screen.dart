import 'package:autcloud/screens/eighth_screen.dart';
import 'package:autcloud/widgets/dropdown_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Ask Target Stability Screen

class SeventhScreen extends StatelessWidget {
  SeventhScreen({super.key});

  final TargetStabilityTypeDropdownController controller =
      Get.put(TargetStabilityTypeDropdownController());

  final targetStabilityTypeList = [
    "Basic (~99% uptime)",
    "Reliable (~99.9% uptime)",
    "Mission~Critical (~99.99% uptime)",
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownScreenTemplate(
      title: "Balancing stability and cost is key\nwe can plan around your priorities",
      subtitle: "What’s your target stability, considering the trade-off between reliability and cost?",
      dropdownItems: targetStabilityTypeList,
      selectedValue: controller.selectedTargetStabilityType,
      onSubmit: () {
        Get.to(EighthScreen());
      },
      currentPage: 6,
    );
  }
}

class TargetStabilityTypeDropdownController extends GetxController {
  var selectedTargetStabilityType = ''.obs;

  getTargetStabilityType() {
    return selectedTargetStabilityType.value;
  }
}