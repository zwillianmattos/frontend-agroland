import 'package:agro_tools/app/modules/account/models/user.dart';

class Replies {
  int? id;
  String? body;
  String? createdAt;
  String? updatedAt;
  User? user;

  Replies({this.id, this.body, this.createdAt, this.updatedAt, this.user});

  Replies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    return data;
  }
}
