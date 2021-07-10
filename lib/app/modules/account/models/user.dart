import 'package:plant_care/app/core/interfaces/user_interface.dart';

class User implements IUser {
  int? id;
  String? name;
  String? email;
  String? password;
  String? imgProfile;

  User({this.id, this.name, this.email, this.password, this.imgProfile});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    imgProfile = json['img_profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['img_profile'] = this.imgProfile;
    
    return data;
  }
}
