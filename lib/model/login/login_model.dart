class LoginModel {
  String accessToken;
  String tokenType;
  int expiresIn;
  String scope;
  String idToken;
  String refreshToken;

  bool get isLoggedIn => accessToken.isNotEmpty;

  LoginModel({
    this.accessToken = '',
    this.tokenType = '',
    this.expiresIn = 0,
    this.scope = '',
    this.idToken = '',
    this.refreshToken = '',
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json['access_token'] ?? '',
      tokenType: json['token_type'] ?? '',
      expiresIn: json['expires_in'] ?? 0,
      scope: json['scope'] ?? '',
      idToken: json['id_token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
      'scope': scope,
      'id_token': idToken,
      'refresh_token': refreshToken,
    };
  }

  get(String s) {}
}
