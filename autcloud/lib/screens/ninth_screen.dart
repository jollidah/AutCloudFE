import 'package:autcloud/screens/last_screen.dart';
import 'package:autcloud/widgets/dropdown_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Ask Scalable Screen

class NinthScreen extends StatelessWidget {
  NinthScreen({super.key});

  final DataTypeDropdownController controller = Get.put(DataTypeDropdownController());

  final dataTypeList = [
    "simple (Minimal data processing)",
    "standard (Text or small file processing)",
    "large (Image or document handling)",
    "extreme (Video, streaming, or\nlarge-scale batch processing)",
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownScreenTemplate(
      title: "What type of data does your service\nneed to handle?",
      subtitle: "",
      additionalText: "Last Question 🚀",
      dropdownItems: dataTypeList,
      selectedValue: controller.selectedDataType,
      onSubmit: () async{
        // await sendRequest();
        // writeToFile();
        Get.to(LastScreen());
      },
      currentPage: 8
    );
  }
}

class DataTypeDropdownController extends GetxController {
  var selectedDataType = ''.obs;

  getDataType() {
    return selectedDataType.value;
  }
}