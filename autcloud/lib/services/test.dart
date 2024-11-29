import 'package:autcloud/models/autcloud_data.dart';

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