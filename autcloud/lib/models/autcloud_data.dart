
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

class ResponseIaC{
  final String serviceName;
  final String iacCode;
  final ComputingResourceSpec computingResourceSpec;

  ResponseIaC({
    required this.serviceName,
    required this.iacCode,
    required this.computingResourceSpec,
  });

  factory ResponseIaC.fromJson(Map<String, dynamic> json){
    return ResponseIaC(
      serviceName: json['service_name'],
      iacCode: json['iac_code'],
      computingResourceSpec: ComputingResourceSpec.fromJson(json['computing_resource_spec']),
    );
  }
}

class ComputingResourceSpec{
  final String vCpuCores;
  final String memory;
  final String disk;
  final String bandwidth;
  final String numOfInstance;

  ComputingResourceSpec({
    required this.vCpuCores,
    required this.memory,
    required this.disk,
    required this.bandwidth,
    required this.numOfInstance,
  });

  factory ComputingResourceSpec.fromJson(Map<String, dynamic> json){
    return ComputingResourceSpec(
      vCpuCores: json['vcpu_cores'],
      memory: json['memory'],
      disk: json['disk'],
      bandwidth: json['bandwidth'],
      numOfInstance: json['num_of_instance'],
    );
  }
}