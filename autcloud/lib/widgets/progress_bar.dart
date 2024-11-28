import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressBarExample extends StatelessWidget {
  final int currentPage; // 인수로 받아올 변수
  final int totalPages; // 필요하면 totalPages도 외부에서 설정 가능하도록 변경

  ProgressBarExample({
    super.key,
    required this.currentPage, // 생성자로 값 전달
    this.totalPages = 8, // 기본값 설정
  });

  // final int _currentPage = 0;

  final int _totalPages = 8;

  @override
  Widget build(BuildContext context) {
    double progress = currentPage / _totalPages;

    return Container(
      // height: 80,
      // width: 400,
      // color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                iconSize: 18,
                onPressed: (){
                  Get.back();
                },
              ),
              Stack(
                children: [
                  Container(
                    height: 20,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 300 * progress,
                    decoration: BoxDecoration(
                      color: Color(0xffedd9aa),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                iconSize: 18,
                color: Colors.white,
                onPressed: (){},
              )
            ],
          ),
          Text(
            '${currentPage} / $_totalPages',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}