class LoginRequest {
  String email;
  String password;
  String imei;
  String deviceType;
  LoginRequest(
    this.email,
    this.deviceType,
    this.imei,
    this.password,
  );
}
