class RegisterRequestModel {
  final String phone;
  final String password;
  final String displayName;
  final int experienceYears;
  final String address;
  final String level;

  RegisterRequestModel({
    required this.phone,
    required this.password,
    required this.displayName,
    required this.experienceYears,
    required this.address,
    required this.level,
  });
}