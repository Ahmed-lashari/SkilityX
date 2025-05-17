import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Users {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String bio;
  @HiveField(4)
  final String mainSkill;
  @HiveField(5)
  final List<String> SkillsOffered;
  @HiveField(6)
  final List<String> skillsToLearn;
  @HiveField(7)
  final String gpsLocation;
  @HiveField(8)
  final String fcmToken;
  @HiveField(9)
  final String profilePicUrl;
  @HiveField(10)
  final String coverPhotoUrl;
  @HiveField(11)
  final bool activeStatus;
  @HiveField(12)
  final String gender;

  const Users({
    required this.id,
    required this.name,
    required this.email,
    required this.bio,
    required this.mainSkill,
    required this.SkillsOffered,
    required this.skillsToLearn,
    required this.gpsLocation,
    required this.fcmToken,
    required this.profilePicUrl,
    required this.coverPhotoUrl,
    required this.activeStatus,
    required this.gender,
  });

  Users copyWith({
    final String? id,
    final String? name,
    final String? email,
    final String? bio,
    final String? mainSkill,
    final List<String>? SkillsOffered,
    final List<String>? skillsToLearn,
    final String? gpsLocation,
    final String? fcmToken,
    final String? profilePicUrl,
    final String? coverPhotoUrl,
    final bool? activeStatus,
    final String? gender,
  }) {
    return Users(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      mainSkill: mainSkill ?? this.mainSkill,
      SkillsOffered: SkillsOffered ?? this.SkillsOffered,
      skillsToLearn: skillsToLearn ?? this.skillsToLearn,
      gpsLocation: gpsLocation ?? this.gpsLocation,
      fcmToken: fcmToken ?? this.fcmToken,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      coverPhotoUrl: coverPhotoUrl ?? this.coverPhotoUrl,
      activeStatus: activeStatus ?? this.activeStatus,
      gender: gender ?? this.gender,
    );
  }

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
