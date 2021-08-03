import 'package:plant_care/app/core/interfaces/user_interface.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models/producer_user.dart';

class User implements IUser {
  int? id;
  String? name;
  String? email;
  String? password;
  String? imgProfile;
  ProducerUser? producerUser;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.imgProfile,
      this.producerUser});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    imgProfile = json['img_profile'];
    if (json['ProducerUser'] != null)
      producerUser = ProducerUser.fromJson(json['ProducerUser']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['img_profile'] = this.imgProfile;
    data['ProducerUser'] = this.producerUser;
    return data;
  }
}
