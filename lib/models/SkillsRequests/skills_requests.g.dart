// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_requests.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SkillsRequestsAdapter extends TypeAdapter<SkillsRequests> {
  @override
  final int typeId = 2;

  @override
  SkillsRequests read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SkillsRequests(
      requestId: fields[0] as String,
      fromUserId: fields[1] as String,
      toUserId: fields[2] as String,
      skillsOffered: fields[3] as String,
      message: fields[4] as String,
      status: fields[5] as String,
      createdAt: fields[6] as String,
      senderName: fields[7] as String,
      receiverName: fields[8] as String,
      senderMainSkill: fields[9] as String,
      senderContactNumber: fields[11] as String,
      fcmToken: fields[12] as String,
      senderPicUrl: fields[13] as String,
      receiverMainName: fields[10] as String,
      courseDuration: fields[15] as String,
      courseLessons: fields[16] as String,
      receiverPicUrl: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SkillsRequests obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.requestId)
      ..writeByte(1)
      ..write(obj.fromUserId)
      ..writeByte(2)
      ..write(obj.toUserId)
      ..writeByte(3)
      ..write(obj.skillsOffered)
      ..writeByte(4)
      ..write(obj.message)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.senderName)
      ..writeByte(8)
      ..write(obj.receiverName)
      ..writeByte(9)
      ..write(obj.senderMainSkill)
      ..writeByte(10)
      ..write(obj.receiverMainName)
      ..writeByte(11)
      ..write(obj.senderContactNumber)
      ..writeByte(12)
      ..write(obj.fcmToken)
      ..writeByte(13)
      ..write(obj.senderPicUrl)
      ..writeByte(14)
      ..write(obj.receiverPicUrl)
      ..writeByte(15)
      ..write(obj.courseDuration)
      ..writeByte(16)
      ..write(obj.courseLessons);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SkillsRequestsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      courseDuration: json['courseDuration'] as String,
      courseLessons: json['courseLessons'] as String,
      receiverPicUrl: json['receiverPicUrl'] as String,
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
      'receiverPicUrl': instance.receiverPicUrl,
      'courseDuration': instance.courseDuration,
      'courseLessons': instance.courseLessons,
    };
