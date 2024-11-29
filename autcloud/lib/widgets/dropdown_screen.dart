import 'package:autcloud/widgets/input_box_decoration.dart';
import 'package:autcloud/widgets/progress_bar.dart';
import 'package:autcloud/widgets/dropdown_submit_button.dart';
import 'package:autcloud/widgets/upper_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final RxString selectedValue;
  final String hintText;

  CustomDropdown({
    required this.items,
    required this.selectedValue,
    required this.hintText,
  });

  IsDropdownSelectedController isDropdownSelectedController = Get.put(IsDropdownSelectedController());

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputBoxDecoration(),
      dropdownColor: Colors.white,
      menuMaxHeight: 300,
      value: selectedValue.value.isEmpty ? null : selectedValue.value,
      onChanged: (newValue) {
        selectedValue.value = newValue!;
        isDropdownSelectedController.change(true);
      },
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
    );
  }
}

// 공통 화면 템플릿 위젯
class DropdownScreenTemplate extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? additionalText; // 추가 텍스트
  final List<String> dropdownItems;
  final RxString selectedValue;
  final VoidCallback onSubmit;
  final currentPage;

  DropdownScreenTemplate({
    required this.title,
    required this.subtitle,
    this.additionalText, // 선택적으로 추가할 텍스트
    required this.dropdownItems,
    required this.selectedValue,
    required this.onSubmit,
    required this.currentPage,
  });

  IsDropdownSelectedController isDropdownSelectedController = Get.put(IsDropdownSelectedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: UpperContent(
              "",
              title: title,
              subtitle: subtitle,
              additionalText: additionalText,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Container(
                    margin: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 드롭다운 박스
                        Container(
                          width: 400,
                          height: 50,
                          child: CustomDropdown(
                            items: dropdownItems,
                            selectedValue: selectedValue,
                            hintText: "Select an option",
                          ),
                        ),
                        const SizedBox(width: 30,),
                        DropdownSubmitButton(
                          onTap: () {
                            if (isDropdownSelectedController.isSelected.value) {
                              onSubmit(); 
                              isDropdownSelectedController.change(false); // 선택 상태 초기화
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ProgressBarExample(currentPage: currentPage,),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 드롭다운 버튼 선택 여부 
class IsDropdownSelectedController extends GetxController {
  RxBool isSelected = false.obs;

  void change(bool newValue) {
    isSelected.value = newValue; // .value로 접근하여 값을 업데이트합니다.
  }
}