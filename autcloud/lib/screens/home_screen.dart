import 'package:autcloud/screens/main_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      uppterTitle: "AutCloud", 
      upperSubtitle: "Build infrastructure easily!",
    );
  }
}