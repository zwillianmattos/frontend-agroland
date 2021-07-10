import 'package:plant_care/app/modules/account/models/user.dart';

class AccountModel {
  String? token;
  User? user;

  AccountModel({this.token, this.user});

  AccountModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    if (json['user'] != null) {
      user = User.fromJson(json['user']);
    } else {
      user = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user;
    }
    return data;
  }
}
