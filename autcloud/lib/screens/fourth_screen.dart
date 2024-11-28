import 'package:autcloud/screens/fifth_screen.dart';
import 'package:autcloud/widgets/dropdown_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Ask Approach to Package Screen

class FourthScreen extends StatelessWidget {
  FourthScreen({super.key});

  final PackagingTypeDropdownController controller =
      Get.put(PackagingTypeDropdownController());

  final packagingTypeList = [
    "Game",
    "Mobile app",
    "Desktop/Laptop app",
    "Website", 
    "Marketplace",
    "API Server",
    "SDK"
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownScreenTemplate(
      title: "This seems like a robust service",
      subtitle: "What's your approach to packaging it?",
      dropdownItems: packagingTypeList,
      selectedValue: controller.selectedPackageType,
      onSubmit: () {
        Get.to(FifthScreen());
      },
      currentPage: 3,
    );
  }
}

class PackagingTypeDropdownController extends GetxController {
  var selectedPackageType = ''.obs;

  getPackagingType() {
    print(selectedPackageType.value);
    switch (selectedPackageType.value) {
      case "Game":
        return "Game";
      case "Mobile":
        return "MobileApp";
      case "Desktop/Laptop":
        return "DesktopLaptopApp";
      case "Website":
        return "Website";
      case "Marketplace":
        return "Marketplace";
      case "API Server":
        return "APIServer";
      case "SDK":
        return "SDK";
    }
    return selectedPackageType.value;
  }
}