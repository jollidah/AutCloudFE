
// 요청 데이터 모델
class RequestIac {
  final String serviceName;
  final String serviceType;
  final String packagingForm;
  final String computingServiceModel;
  final String profitModel;
  final String targetStability;
  final String anticipatedTraffic;
  final String dataProcessingRequirement;

  RequestIac({
    required this.serviceName,
    required this.serviceType,
    required this.packagingForm,
    required this.computingServiceModel,
    required this.profitModel,
    required this.targetStability,
    required this.anticipatedTraffic,
    required this.dataProcessingRequirement,
  });

  // 객체를 JSON 형식으로 변환
  Map<String, dynamic> toJson() {
    return {
      'service_name': serviceName,
      'service_type': serviceType,
      'packaging_form': packagingForm,
      'computing_service_model': computingServiceModel,
      'profit_model': profitModel,
      'target_stability': targetStability,
      'anticipated_traffic': anticipatedTraffic,
      'data_processing_requirement': dataProcessingRequirement,
    };
  }
}