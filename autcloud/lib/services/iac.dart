import 'dart:typed_data';
import 'dart:html' as html;
import 'package:autcloud/models/autcloud_data.dart';

void writeToFile(ResponseIaC responseIaC) {
  // 문자열 선언
  String file_path = "${responseIaC.serviceName}_IaC.tf";
  String iac_codes = responseIaC.iacCode;
  
  // 문자열을 바이트 배열로 변환
  Uint8List bytes = Uint8List.fromList(iac_codes.codeUnits);

  // Blob 객체 생성
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  
  // 다운로드 링크 생성
  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', file_path)
    ..click();

  // URL 해제
  html.Url.revokeObjectUrl(url);
}
