class AccountModel {
  String? token;
  Map<String, dynamic>? user;

  AccountModel({this.token, this.user});

  AccountModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    if (json['user'] != null) {
      user = json['user'];
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
