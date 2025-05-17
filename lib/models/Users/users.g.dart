// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsersAdapter extends TypeAdapter<Users> {
  @override
  final int typeId = 0;

  @override
  Users read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Users(
      id: fields[0] as String,
      name: fields[1] as String,
      email: fields[2] as String,
      bio: fields[3] as String,
      mainSkill: fields[4] as String,
      SkillsOffered: (fields[5] as List).cast<String>(),
      skillsToLearn: (fields[6] as List).cast<String>(),
      gpsLocation: fields[7] as String,
      fcmToken: fields[8] as String,
      profilePicUrl: fields[9] as String,
      coverPhotoUrl: fields[10] as String,
      activeStatus: fields[11] as bool,
      gender: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Users obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.bio)
      ..writeByte(4)
      ..write(obj.mainSkill)
      ..writeByte(5)
      ..write(obj.SkillsOffered)
      ..writeByte(6)
      ..write(obj.skillsToLearn)
      ..writeByte(7)
      ..write(obj.gpsLocation)
      ..writeByte(8)
      ..write(obj.fcmToken)
      ..writeByte(9)
      ..write(obj.profilePicUrl)
      ..writeByte(10)
      ..write(obj.coverPhotoUrl)
      ..writeByte(11)
      ..write(obj.activeStatus)
      ..writeByte(12)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      bio: json['bio'] as String,
      mainSkill: json['mainSkill'] as String,
      SkillsOffered: (json['SkillsOffered'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      skillsToLearn: (json['skillsToLearn'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      gpsLocation: json['gpsLocation'] as String,
      fcmToken: json['fcmToken'] as String,
      profilePicUrl: json['profilePicUrl'] as String,
      coverPhotoUrl: json['coverPhotoUrl'] as String,
      activeStatus: json['activeStatus'] as bool,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'bio': instance.bio,
      'mainSkill': instance.mainSkill,
      'SkillsOffered': instance.SkillsOffered,
      'skillsToLearn': instance.skillsToLearn,
      'gpsLocation': instance.gpsLocation,
      'fcmToken': instance.fcmToken,
      'profilePicUrl': instance.profilePicUrl,
      'coverPhotoUrl': instance.coverPhotoUrl,
      'activeStatus': instance.activeStatus,
      'gender': instance.gender,
    };
