import 'package:autcloud/style.dart';
import 'package:flutter/material.dart';

class UpperContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? additionalText; // 추가 텍스트

  const UpperContent(String s, {
    super.key,
    required this.title,
    required this.subtitle,
    this.additionalText, // 선택적으로 추가할 텍스트
  });

  @override
  Widget build(BuildContext context) {
    // uptterTitle을 \n을 기준으로 나누기
    List<String> titleLines = title.split("\n");

    return Container(
      color: MainColors.yellow,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (additionalText != null) 
            Text(
              additionalText!,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
            ),
          // 제목을 각 줄로 나누어 중앙 정렬
          ...titleLines.map((line) {
            return Text(
              line,
              style: titleTextStyle,
            );
          }).toList(),
          // 서브타이틀 추가
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: subtitleTextStyle
          ),
        ],
      ),
    );
  }
}