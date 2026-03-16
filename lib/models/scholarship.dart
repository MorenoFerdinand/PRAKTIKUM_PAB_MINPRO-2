class Scholarship {
  final String? id; 
  final String scholarshipName;
  final String provider;
  final String keyRequirement;

  Scholarship({
    this.id, 
    required this.scholarshipName, 
    required this.provider, 
    required this.keyRequirement
  });

  factory Scholarship.fromMap(Map<String, dynamic> map) {
    return Scholarship(
      id: map['id'].toString(),
      scholarshipName: map['scholarship_name'] ?? '',
      provider: map['provider'] ?? '',
      keyRequirement: map['key_requirement'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'scholarship_name': scholarshipName,
      'provider': provider,
      'key_requirement': keyRequirement,
    };
  }
}