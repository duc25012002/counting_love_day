// ignore_for_file: overridden_fields, file_names

import 'package:counting_love_day/domain/entities/request_couple_entity.dart';

class RequestCoupleModel extends RequestCoupleEntity {
  RequestCoupleModel({
    int? id,
    String? senderUuid,
    String? userEmail,
  }) : super(id: id, senderUuid: senderUuid, userEmail: userEmail);

  factory RequestCoupleModel.fromJson(dynamic json) {
    return RequestCoupleModel(
      id: json['id'],
      senderUuid: json['sender_uuid'],
      userEmail: json['user_email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderUuid': senderUuid,
      'userEmail': userEmail,
    };
  }
}
