// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names

import 'dart:convert';

import 'package:counting_love_day/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    String? userEmail,
    String? userName,
    String? password,
  }) : super(userEmail: userEmail, userName: userName, password: password);

  // --> dart to json
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': userEmail,
      'password': password,
      'userName': userName,
    };
  }

  // --> json to dart
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userEmail: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
