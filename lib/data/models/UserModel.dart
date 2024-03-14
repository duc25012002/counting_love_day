// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names

import 'package:counting_love_day/domain/entities/UserEntity.dart';

class UserModel extends UserEntity {
  UserModel({
    String? userEmail,
    String? userName,
    String? password,
  }) : super(userEmail: userEmail, userName: userName, password: password);
}
