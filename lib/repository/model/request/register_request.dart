class RegisterRequest {
  String name;
  String email;
  String phone;
  String birthDate;
  String gender;
  String password;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.birthDate,
    required this.gender,
  });

  Map<String, String> toJson() => {
    "name" : name,
    "email" : email,
    "phone" : phone,
    "birthdate" : birthDate,
    "gender" : gender,
    "password" : password
  };

}
