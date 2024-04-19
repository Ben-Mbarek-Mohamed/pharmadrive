class ProfileModel {
  final String id;
  final String name;
  final String representant;
  final String email;
  final String phone;

  ProfileModel({
    this.id,
    this.name,
    this.representant,
    this.email,
    this.phone,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id'],
      name: json['name'],
      representant: json['representant'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
