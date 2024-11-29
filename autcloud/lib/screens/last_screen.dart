import 'package:autcloud/screens/fifth_screen.dart';
import 'package:autcloud/screens/fourth_screen.dart';
import 'package:autcloud/screens/ninth_screen.dart';
import 'package:autcloud/screens/sixth_screen.dart';
import 'package:autcloud/screens/second_screen.dart';
import 'package:autcloud/screens/eighth_screen.dart';
import 'package:autcloud/screens/seventh_screen.dart';
import 'package:autcloud/screens/third_screen.dart';
import 'package:autcloud/style.dart';
import 'package:autcloud/widgets/upper_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:autcloud/models/autcloud_data.dart';
import 'package:autcloud/services/iac.dart';

class LastScreen extends StatefulWidget {
  final ResponseIaC responseIaC;

  LastScreen({Key? key, required this.responseIaC}) : super(key: key); // Update constructor
 
  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // 2초 후에 로딩 애니메이션을 숨기고 콘텐츠를 표시
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        // TODO represent computing resource spec
        print(widget.responseIaC);
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  // // Service name
  // final ServiceNameInputController serviceNameInputController =
  //     Get.put(ServiceNameInputController());

  // // Service type
  // final ServiceTypeDropdownController serviceTypeDropdownController =
  //     Get.put(ServiceTypeDropdownController());

  // // Package
  // final PackagingTypeDropdownController packagingTypeDropdownController =
  //     Get.put(PackagingTypeDropdownController());

  // // Computer Service Model
  // final ComputingServiceModelDropdownController
  //     computingServiceModelDropdownController =
  //     Get.put(ComputingServiceModelDropdownController());

  // // Profit model
  // final ProfitModelTypeDropdownController profitModelTypeDropdownController =
  //     Get.put(ProfitModelTypeDropdownController());

  // // Target stability
  // final TargetStabilityTypeDropdownController
  //     targetStabilityTypeDropdownController =
  //     Get.put(TargetStabilityTypeDropdownController());

  // // Anticipated traffic
  // final ScalableTypeDropdownController scalableTypeDropdownController =
  //     Get.put(ScalableTypeDropdownController());

  // // Data processing
  // final DataTypeDropdownController dataTypeDropdownController =
  //     Get.put(DataTypeDropdownController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 기존 콘텐츠
          Column(
            children: [
              const Flexible(
                flex: 1,
                child: UpperContent("", title: "", subtitle: ""),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      // 다운로드 버튼
                      Container(
                        margin: const EdgeInsets.all(30),
                        child: DownloadButton(_isLoading, widget.responseIaC),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 로딩 애니메이션을 Stack에 추가
          if (_isLoading)
            Positioned.fill(
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
        ],
      ),
    );
    // return Center(
    //   child: Column(
    //     children: [
    //       Text(serviceNameInputController.serviceNameInput.value),
    //       Text(serviceTypeDropdownController.selectedServiceType.value),
    //       Text(packagingTypeDropdownController.selectedPackageType.value),
    //       Text(computingServiceModelDropdownController.selectedComputerServiceModel.value),
    //       Text(profitModelTypeDropdownController.selectedProfitModelType.value),
    //       Text(targetStabilityTypeDropdownController.selectedTargetStabilityType.value),
    //       Text(scalableTypeDropdownController.selectedScalableType.value),
    //       Text(dataTypeDropdownController.selectedDataType.value)
    //     ],
    //   ),
    // );
  }
}



// 다운로드 버튼
Widget DownloadButton(_isLoading, ResponseIaC responseIaC) {
  return GestureDetector(
    onTap: () {
      _isLoading ? null : writeToFile(responseIaC);
    },
    child: Container(
      height: 70,
      width: 160,
      decoration: BoxDecoration(
        color: _isLoading ? Color(0xffaaaaaa) : MainColors.yellow,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: TextColors.title,
          width: 3,
        ),
      ),
      child: const Center(
        child: Text(
          "Download Iac",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    ),
  );
}