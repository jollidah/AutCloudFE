import 'package:autcloud/widgets/dropdown_screen.dart';
import 'package:autcloud/screens/seventh_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Ask Profit Model Screen

class SixthScreen extends StatelessWidget {
  SixthScreen({super.key});

  final ProfitModelTypeDropdownController controller =
      Get.put(ProfitModelTypeDropdownController());

  final profitModelTypeList = [
    "Subscription fee",
    "Referral fee/commission",
    "Access rights sales",
    "Advertising",
    "Product/Item/Service sales",
    "API consumption",
    "Licensing + Maintenance"
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownScreenTemplate(
      title: "Now we can design architecture! \nWe need more detail to build cloud",
      subtitle: "What is your profit model?",
      dropdownItems: profitModelTypeList,
      selectedValue: controller.selectedProfitModelType,
      onSubmit: () {
        Get.to(SeventhScreen());
      },
      currentPage: 5,
    );
  }
}

class ProfitModelTypeDropdownController extends GetxController {
  var selectedProfitModelType = ''.obs;

  getProfitModelType() {
    return selectedProfitModelType.value;
  }
}