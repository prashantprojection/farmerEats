class BusinessModel {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String role;
  final String businessName;
  final String informalName;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String registrationProof;
  final Map<String, List<String>> businessHours;
  final String deviceToken;
  final String type;
  final String socialId;

  BusinessModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
    required this.businessName,
    required this.informalName,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.registrationProof,
    required this.businessHours,
    required this.deviceToken,
    required this.type,
    required this.socialId,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      role: json['role'],
      businessName: json['business_name'],
      informalName: json['informal_name'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zip_code'],
      registrationProof: json['registration_proof'],
      businessHours: Map<String, List<String>>.from(json['business_hours']),
      deviceToken: json['device_token'],
      type: json['type'],
      socialId: json['social_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'role': role,
      'business_name': businessName,
      'informal_name': informalName,
      'address': address,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'registration_proof': registrationProof,
      'business_hours': businessHours,
      'device_token': deviceToken,
      'type': type,
      'social_id': socialId,
    };
  }
}
