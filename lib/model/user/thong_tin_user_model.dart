class UserModel {
  ExtraProperties? extraProperties;
  String? userName;
  String? email;
  String? name;
  String? surname;
  String? phoneNumber;
  bool? isExternal;
  bool? hasPassword;
  String? concurrencyStamp;

  UserModel(
      {this.extraProperties,
      this.userName,
      this.email,
      this.name,
      this.surname,
      this.phoneNumber,
      this.isExternal,
      this.hasPassword,
      this.concurrencyStamp});

  UserModel.fromJson(Map<String, dynamic> json) {
    extraProperties = json['extraProperties'] != null
        ? new ExtraProperties.fromJson(json['extraProperties'])
        : null;
    userName = json['userName'];
    email = json['email'];
    name = json['name'];
    surname = json['surname'];
    phoneNumber = json['phoneNumber'];
    isExternal = json['isExternal'];
    hasPassword = json['hasPassword'];
    concurrencyStamp = json['concurrencyStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.extraProperties != null) {
      data['extraProperties'] = this.extraProperties!.toJson();
    }
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['phoneNumber'] = this.phoneNumber;
    data['isExternal'] = this.isExternal;
    data['hasPassword'] = this.hasPassword;
    data['concurrencyStamp'] = this.concurrencyStamp;
    return data;
  }
}

class ExtraProperties {
  String? additionalProp1;
  String? additionalProp2;
  String? additionalProp3;

  ExtraProperties(
      {this.additionalProp1, this.additionalProp2, this.additionalProp3});

  ExtraProperties.fromJson(Map<String, dynamic> json) {
    additionalProp1 = json['additionalProp1'];
    additionalProp2 = json['additionalProp2'];
    additionalProp3 = json['additionalProp3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionalProp1'] = this.additionalProp1;
    data['additionalProp2'] = this.additionalProp2;
    data['additionalProp3'] = this.additionalProp3;
    return data;
  }
}
