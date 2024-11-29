import 'package:autcloud/screens/fourth_screen.dart';
import 'package:autcloud/widgets/dropdown_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// Ask Service Type Screen

class ThirdScreen extends StatelessWidget {
  ThirdScreen({super.key});

  final ServiceTypeDropdownController controller =
      Get.put(ServiceTypeDropdownController());

  final serviceTypeList = [
    "Video streaming",
    "Ecommerce",
    "Online education",
    "Online social media",
    "Game", 
    "Music streaming",
    "Weather forecasting API(for Engineer)",
    "AI model hosting",
    "IoT device managing",
    "Blogging platform",
    "Online appointment service",
    "Fitness tracking app",
    "Online survey platform", 
    "Online collaboration/productivity service",
    "Online PayFac",
    "Online photo sharing service",
    "Ride hailing service",
    "Customer support chatbot",
    "Video editing tools"
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownScreenTemplate(
      title: "Interesting name\nI want to know more about your service!",
      subtitle: "What type is it?",
      dropdownItems: serviceTypeList,
      selectedValue: controller.selectedServiceType,
      onSubmit: () {
        Get.to(FourthScreen());
      },
      currentPage: 2,
    );
  }
}

class ServiceTypeDropdownController extends GetxController {
  var selectedServiceType = ''.obs;

  getServiceType() {
    switch (selectedServiceType.value) {
      case "Game":
        return "Game";
      case "Online education":
        return "OnlineEducation";
      case "Online social media":
        return "OnlineSocialMedia";
      case "Video streaming":
        return "VideoStreaming";
      case "Ecommerce":
        return "Ecommerce";
      case "Music streaming":
        return "MusicStreaming";
      case "Weather forecasting API(for Engineer)":
        return "WeatherForecastingAPIForEngineer";
      case "AI model hosting":
        return "AiModelCodeHosting";
      case "IoT device managing":
        return "IotDeviceManaging";
      case "Blogging platform":
        return "BloggingPlatform";
      case "Online appointment service":
        return "OnlineAppointmentService";
      case "Fitness tracking app":
        return "FitnessTrackingApp";
      case "Online survey platform":
        return "OnlineSurveyPlatform";
      case "Online collaboration/productivity service":
        return "OnlineCollaborationProductivityService";
      case "Online PayFac":
        return "OnlinePayFac";
      case "Online photo sharing service":
        return "OnlinePhotoSharingService";
      case "Ride hailing service":
        return "RideHailingService";
      case "Customer support chatbot":
        return "CustomerSupportChatbot";
      case "Video editing tools":
        return "VideoEditingTools";
    }
  }
}