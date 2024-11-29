import 'package:autcloud/screens/second_screen.dart';
import 'package:autcloud/style.dart';
import 'package:autcloud/widgets/upper_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
  bool _isResourceLoading = true;
  bool _isIaCLoading = true;

  ServiceNameInputController serviceNameInputController =
      Get.put(ServiceNameInputController());

  @override
  void initState() {
    super.initState();
    // 2초 후에 로딩 애니메이션을 숨기고 컴퓨팅리소스 표시
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isResourceLoading = false;
      });
    });
    // 컴퓨팅리소스 표시 1초 후 다운로드 버튼 활성화
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _isIaCLoading = false;
      });
    });
  }

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
                      const SizedBox(height: 200),
                      // 다운로드 버튼
                      Container(
                          margin: const EdgeInsets.all(30),
                          child: DownloadButton(_isIaCLoading, widget.responseIaC),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          // 로딩 애니메이션을 Stack에 추가
          if (_isResourceLoading)
            Positioned.fill(
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
          if (!_isResourceLoading)
            Positioned.fill(
              child: Center(
                child: ComputingResourceBox(widget.responseIaC),
              ),
            )
        ],
      ),
    );
  }
}

// 다운로드 버튼
Widget DownloadButton(_isIaCLoading, ResponseIaC responseIaC) {
  return GestureDetector(
    onTap: () {
      _isIaCLoading ? null : writeToFile(responseIaC);
    },
    child: Container(
      height: 70,
      width: 160,
      decoration: BoxDecoration(
        color: _isIaCLoading ?  Color(0xffaaaaaa) : MainColors.yellow,
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

// Computing Resource 박스
Widget ComputingResourceBox(ResponseIaC responseIaC) {
  ServiceNameInputController serviceNameInputController =
      Get.put(ServiceNameInputController());
  return Container(
    padding: const EdgeInsets.all(10),
    width: 400,
    height: 420,
    decoration: BoxDecoration(
      color: Colors.white, // 메인 컬러: 화이트
      borderRadius: BorderRadius.circular(20), // 둥근 모서리
      boxShadow: const [
        BoxShadow(
          color: Color(0xFFF2F2F2), // 그림자 색상: 연한 회색
          offset: Offset(0, 5), // 그림자가 아래쪽으로만 이동
          blurRadius: 8, // 흐림 정도
          spreadRadius: 1, // 그림자의 퍼짐 정도
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          serviceNameInputController.getServiceName(),
          style: TextStyle(color: TextColors.subtitle),
        ),
        const Text(
          "Calculated computing resource spec",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        // 구분선
        const Divider(
          color: Colors.grey, // 선 색상
          thickness: 1.0, // 선 두께
          height: 20.0, // 위, 아래 여백 포함 높이
        ),
        ListTile(
          title: Text(responseIaC.computingResourceSpec.vCpuCores.toString()), 
          subtitle: Text('V-CPU cores'), 
          leading: Icon(Icons.star_border_rounded), 
          onTap: () {
          }, 
        ),
        ListTile(
          title: Text(responseIaC.computingResourceSpec.memory.toString()), 
          subtitle: Text('Memory'),
          leading: Icon(Icons.star_border_rounded), 
          onTap: () {
          }, 
        ),
        ListTile(
          title: Text(responseIaC.computingResourceSpec.storage.toString()), 
          subtitle: Text('Storage'), 
          leading: Icon(Icons.star_border_rounded), 
          onTap: () {
          }, 
        ),
        ListTile(
          title: Text(responseIaC.computingResourceSpec.bandwidth.toString()), 
          subtitle: Text('BandWidth'), 
          leading: Icon(Icons.star_border_rounded), 
          onTap: () {
          }, 
        ),
        ListTile(
          title: Text(responseIaC.computingResourceSpec.numOfInstance.toString()), 
          subtitle: Text('No. of instances'), 
          leading: Icon(Icons.star_border_rounded), 
          onTap: () {
          }, 
        ),
      ],
    ),
  );
}
