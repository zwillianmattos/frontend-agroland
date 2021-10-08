import 'package:plant_care/app/modules/account/models/user.dart';

class ThreadLike {
  int? id;
  User? user;
  ThreadLike({this.id, this.user});

  ThreadLike.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    return data;
  }
}
