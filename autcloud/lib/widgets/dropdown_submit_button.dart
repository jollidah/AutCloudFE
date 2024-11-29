import 'package:autcloud/style.dart';
import 'package:autcloud/widgets/dropdown_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownSubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  
  DropdownSubmitButton({
    super.key,
    required this.onTap,
  });

  IsDropdownSelectedController isDropdownSelectedController = Get.put(IsDropdownSelectedController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(() => Container(
        height: 50,
        width: 90,
        decoration: BoxDecoration(
          color: isDropdownSelectedController.isSelected.value 
            ? TextColors.title 
            : const Color.fromARGB(255, 150, 150, 150), 
          borderRadius: BorderRadius.circular(15), 
        ),
        child: const Center(
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white),
          ),
        ),
      )),
    );
  }
}