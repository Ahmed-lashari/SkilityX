// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../skills_offered.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SkillsOfferedAdapter extends TypeAdapter<SkillsOffered> {
  @override
  final int typeId = 1;

  @override
  SkillsOffered read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SkillsOffered(
      offerId: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      category: fields[3] as String,
      courseDuration: fields[4] as String,
      courseLessons: fields[5] as String,
      status: fields[6] as String,
      createdAt: fields[7] as String,
      fcmToken: fields[8] as String,
      uploaderId: fields[9] as String,
      uploaderName: fields[10] as String,
      courseFee: fields[11] as String,
      uploaderPicUrl: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SkillsOffered obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.offerId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.courseDuration)
      ..writeByte(5)
      ..write(obj.courseLessons)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.fcmToken)
      ..writeByte(9)
      ..write(obj.uploaderId)
      ..writeByte(10)
      ..write(obj.uploaderName)
      ..writeByte(11)
      ..write(obj.courseFee)
      ..writeByte(12)
      ..write(obj.uploaderPicUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SkillsOfferedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillsOffered _$SkillsOfferedFromJson(Map<String, dynamic> json) =>
    SkillsOffered(
      offerId: json['offerId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      courseDuration: json['courseDuration'] as String,
      courseLessons: json['courseLessons'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      fcmToken: json['fcmToken'] as String,
      uploaderId: json['uploaderId'] as String,
      uploaderName: json['uploaderName'] as String,
      courseFee: json['courseFee'] as String,
      uploaderPicUrl: json['uploaderPicUrl'] as String,
    );

Map<String, dynamic> _$SkillsOfferedToJson(SkillsOffered instance) =>
    <String, dynamic>{
      'offerId': instance.offerId,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'courseDuration': instance.courseDuration,
      'courseLessons': instance.courseLessons,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'fcmToken': instance.fcmToken,
      'uploaderId': instance.uploaderId,
      'uploaderName': instance.uploaderName,
      'courseFee': instance.courseFee,
      'uploaderPicUrl': instance.uploaderPicUrl,
    };
