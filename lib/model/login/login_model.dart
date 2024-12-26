class LoginModel {
  String accessToken;
  String refreshToken;
  int expiresIn;
  String logoutUrl;

  bool get isLoggedIn => accessToken.isNotEmpty;

  LoginModel({
    this.accessToken = '',
    this.refreshToken = '',
    this.expiresIn = 0,
    this.logoutUrl = '',
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json['access_token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
      expiresIn: json['expires_in'] ?? 0,
      logoutUrl: json['logout_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'expires_in': expiresIn,
      'logout_url': logoutUrl,
    };
  }
}
