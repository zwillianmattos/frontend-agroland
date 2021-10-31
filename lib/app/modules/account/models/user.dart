import 'package:agro_tools/app/core/interfaces/user_interface.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/producer_user.dart';

class User implements IUser {
  int? id;
  String? name;
  String? email;
  String? password;
  String? imgLogo;
  ProducerUser? producerUser;
  bool? excluded;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.imgLogo,
      this.producerUser,
      this.excluded,
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    imgLogo = json['imgProfile'];
    if(imgLogo == null || imgLogo == " " || imgLogo == ""){
      imgLogo =  "https://www.pngitem.com/pimgs/m/150-1503941_user-windows-10-user-icon-png-transparent-png.png";
    }
    print(imgLogo);
    if (json['ProducerUser'] != null)
      producerUser = ProducerUser.fromJson(json['ProducerUser']);
    excluded = json['excluded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['imgProfile'] = this.imgLogo;
    data['ProducerUser'] = this.producerUser;
    data['excluded'] = this.excluded;
    return data;
  }
}
