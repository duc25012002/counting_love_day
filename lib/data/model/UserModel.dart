// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? userEmail;
  String? password;
  String? userName;
  UserModel({
    this.userEmail,
    this.password,
    this.userName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userEmail': userEmail,
      'password': password,
      'userName': userName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userEmail: map['userEmail'] != null ? map['userEmail'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserModel(userEmail: $userEmail, password: $password, userName: $userName)';
}
