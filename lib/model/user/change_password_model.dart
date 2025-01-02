class ChangePasswordModel {
  String? currentPassword;
  String? newPassword;

  ChangePasswordModel({this.currentPassword, this.newPassword});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    currentPassword = json['currentPassword'];
    newPassword = json['newPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPassword'] = currentPassword;
    data['newPassword'] = newPassword;
    return data;
  }
}
