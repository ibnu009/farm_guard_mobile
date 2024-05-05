class ResetPasswordRequest {
  String credential;
  int otp;
  String password;
  String passwordConfirmation;

  ResetPasswordRequest({
    required this.credential,
    required this.otp,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
    "credential" : credential,
    "password" : password,
    "password_confirmation" : passwordConfirmation,
    "otp" : otp,
  };

}
