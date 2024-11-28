// POST 요청 보내는 함수
import 'dart:convert';
import 'package:autcloud/screens/fifth_screen.dart';
import 'package:autcloud/screens/fourth_screen.dart';
import 'package:autcloud/screens/ninth_screen.dart';
import 'package:autcloud/screens/sixth_screen.dart';
import 'package:autcloud/screens/second_screen.dart';
import 'package:autcloud/screens/eighth_screen.dart';
import 'package:autcloud/screens/seventh_screen.dart';
import 'package:autcloud/screens/third_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io'; // 파일 저장을 위해 사용

Future<ResponseIaC> sendRequest() async {

  final url = Uri.parse('http://localhost:3000/api/v1/external/iac'); 

  // Service name
  final ServiceNameInputController serviceNameInputController = Get.put(ServiceNameInputController());
  final serviceName = serviceNameInputController.getServiceName();
  // Service type
  final ServiceTypeDropdownController serviceTypeDropdownController = Get.put(ServiceTypeDropdownController());
  final serviceType = serviceTypeDropdownController.getServiceType();
  // Package
  final PackagingTypeDropdownController packagingTypeDropdownController = Get.put(PackagingTypeDropdownController());
  final packagingForm = packagingTypeDropdownController.getPackagingType();
  // Computer Service Model
  final ComputingServiceModelDropdownController computingServiceModelDropdownController = Get.put(ComputingServiceModelDropdownController());
  final computingServiceModel = computingServiceModelDropdownController.getComputerServiceModel();
  // Profit model
  final ProfitModelTypeDropdownController profitModelTypeDropdownController = Get.put(ProfitModelTypeDropdownController());
  final profitModel = profitModelTypeDropdownController.getProfitModelType();
  // Target stability
  final TargetStabilityTypeDropdownController targetStabilityTypeDropdownController = Get.put(TargetStabilityTypeDropdownController());
  final targetStability = targetStabilityTypeDropdownController.getTargetStabilityType();
  // Anticipated traffic
  final ScalableTypeDropdownController scalableTypeDropdownController = Get.put(ScalableTypeDropdownController());
  final anticipatedTraffic = scalableTypeDropdownController.getScalableType();
  // Data processing
  final DataTypeDropdownController dataTypeDropdownController = Get.put(DataTypeDropdownController());
  final dataProcessingRequirement = dataTypeDropdownController.getDataType();

  try {
    // POST 요청 보내기
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json', // JSON 형식으로 보낼 것임을 명시
      },
      body: json.encode({ // JSON 형태로 인코딩
        'service_name': serviceName,
        'service_type': serviceType,
        'packaging_form': packagingForm,
        'computing_service_model': computingServiceModel,
        'profit_model': profitModel,
        'target_stability': targetStability,
        'anticipated_traffic': anticipatedTraffic,
        'data_processing_requirement': dataProcessingRequirement,
      }),
    );

    if (response.statusCode == 200) {
      print('요청 성공: ${response.body}');
    } else {
      print('요청 실패: ${response.statusCode}');
    }
  } catch (e) {
    print('오류 발생: $e');
  }
  return ResponseIaC.fromJson(json.decode(response.body));
}
