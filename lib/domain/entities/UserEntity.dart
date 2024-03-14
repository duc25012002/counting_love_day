// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'dart:convert';

class UserEntity {
  final String? userEmail;
  final String? password;
  final String? userName;

  UserEntity({
    this.userEmail,
    this.password,
    this.userName,
  });

  // --> dart to json
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': userEmail,
      'password': password,
      'userName': userName,
    };
  }

  // --> json to dart
  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      userEmail: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
