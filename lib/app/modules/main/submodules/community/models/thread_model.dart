import 'package:agro_tools/app/modules/account/models/user.dart';

import 'channel.dart';
import 'replies_model.dart';
import 'thread_likes_model.dart';

class Thread {
  int? id;
  String? title;
  String? body;
  String? createdAt;
  String? updatedAt;
  User? user;
  Channel? channel;
  List<Replies>? replies;
  List<ThreadLike>? threadLikes;

  Thread(
      {this.id,
      this.title,
      this.body,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.channel,
      this.replies,
      this.threadLikes});

  Thread.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    channel =
        json['Channel'] != null ? new Channel.fromJson(json['Channel']) : null;
    if (json['Replies'] != null) {
      replies = <Replies>[];
      json['Replies'].forEach((v) {
        replies!.add(new Replies.fromJson(v));
      });
    }
    if (json['ThreadLikes'] != null) {
      threadLikes = <ThreadLike>[];
      json['ThreadLikes'].forEach((v) {
        threadLikes!.add(new ThreadLike.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    if (this.channel != null) {
      data['Channel'] = this.channel!.toJson();
    }
    if (this.replies != null) {
      data['Replies'] = this.replies!.map((v) => v.toJson()).toList();
    }
    if (this.threadLikes != null) {
      data['ThreadLikes'] = this.threadLikes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
