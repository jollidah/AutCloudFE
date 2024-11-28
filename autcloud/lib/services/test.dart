import 'package:autcloud/models/autcloud_data.dart';
import 'dart:typed_data';
import 'dart:html' as html;

// TODO! Fix test code
// void writeToFile() {
//     // 문자열 선언
//     String s = "test string!";
    
//     // 문자열을 바이트 배열로 변환
//     Uint8List bytes = Uint8List.fromList(s.codeUnits);

//     // Blob 객체 생성
//     final blob = html.Blob([bytes]);
//     final url = html.Url.createObjectUrlFromBlob(blob);
    
//     // 다운로드 링크 생성
//     final anchor = html.AnchorElement(href: url)
//       ..setAttribute('download', 'test.txt')
//       ..click();

//     // URL 해제
//     html.Url.revokeObjectUrl(url);
//   }

void main() {
  // Assuming jsonString is a valid JSON string
  final jsonString = {
    "service_name": "AutCloud",
    "iac_code": "# Configure the AWS Provider...",
    "computing_resource_spec": {
      "vcpu_cores": "Over 5vCPU",
      "memory": "Over 16GB RAM",
      "disk": "640 GB SSD",
      "bandwidth": "8 TB Transfer",
      "num_of_instance": "2"
    }
  };

  final responseIaC = ResponseIaC.fromJson(jsonString);
  print(responseIaC.serviceName);
}
