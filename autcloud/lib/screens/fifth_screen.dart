import 'package:autcloud/screens/sixth_screen.dart';
import 'package:autcloud/widgets/dropdown_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Ask Interact Screen

class FifthScreen extends StatelessWidget {
  FifthScreen({super.key});

  final ComputingServiceModelDropdownController controller =
      Get.put(ComputingServiceModelDropdownController());
  final computingServiceModelList = [
    "IaaS",
    "PaaS",
    "SaaS",
    "FaaS",
    "API",
    "CodeLibrary",
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownScreenTemplate(
      title: "This approach defines\nhow users will interact with it",
      subtitle: "How is your service delivered?",
      dropdownItems: computingServiceModelList,
      selectedValue: controller.selectedComputerServiceModel,
      onSubmit: () {
        Get.to(SixthScreen());
      },
      currentPage: 4,
    );
  }
}

class ComputingServiceModelDropdownController extends GetxController {
  var selectedComputerServiceModel = ''.obs;

  getComputerServiceModel() {
    return selectedComputerServiceModel.value;
  }
}