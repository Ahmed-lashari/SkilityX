// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../skills_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillsRequests _$SkillsRequestsFromJson(Map<String, dynamic> json) =>
    SkillsRequests(
      requestId: json['requestId'] as String,
      fromUserId: json['fromUserId'] as String,
      toUserId: json['toUserId'] as String,
      skillsOffered: json['skillsOffered'] as String,
      message: json['message'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      senderName: json['senderName'] as String,
      receiverName: json['receiverName'] as String,
      senderMainSkill: json['senderMainSkill'] as String,
      senderContactNumber: json['senderContactNumber'] as String,
      fcmToken: json['fcmToken'] as String,
      senderPicUrl: json['senderPicUrl'] as String,
      receiverMainName: json['receiverMainName'] as String,
    );

Map<String, dynamic> _$SkillsRequestsToJson(SkillsRequests instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'fromUserId': instance.fromUserId,
      'toUserId': instance.toUserId,
      'skillsOffered': instance.skillsOffered,
      'message': instance.message,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'senderName': instance.senderName,
      'receiverName': instance.receiverName,
      'senderMainSkill': instance.senderMainSkill,
      'receiverMainName': instance.receiverMainName,
      'senderContactNumber': instance.senderContactNumber,
      'fcmToken': instance.fcmToken,
      'senderPicUrl': instance.senderPicUrl,
    };
