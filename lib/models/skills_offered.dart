import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/skills_offered.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class SkillsOffered {
  @HiveField(0)
  final String offerId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String courseDuration;
  @HiveField(5)
  final String courseLessons;
  @HiveField(6)
  final String status;
  @HiveField(7)
  final String createdAt;
  @HiveField(8)
  final String fcmToken;
  @HiveField(9)
  final String uploaderId;
  @HiveField(10)
  final String uploaderName;
  @HiveField(11)
  final String courseFee;
  @HiveField(12)
  final String uploaderPicUrl;

  const SkillsOffered({
    required this.offerId,
    required this.title,
    required this.description,
    required this.category,
    required this.courseDuration,
    required this.courseLessons,
    required this.status,
    required this.createdAt,
    required this.fcmToken,
    required this.uploaderId,
    required this.uploaderName,
    required this.courseFee,
    required this.uploaderPicUrl,
  });

  SkillsOffered copyWith(
    final String? id,
    final String? title,
    final String? description,
    final String? category,
    final String? courseDuration,
    final String? courseLessons,
    final String? createdAt,
    final String? status,
    final String? fcmToken,
    final String? uploaderId,
    final String? uploaderName,
    final String? courseFee,
    final String? uploaderPicUrl,
  ) {
    return SkillsOffered(
        offerId: id ?? this.offerId,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        courseDuration: courseDuration ?? this.courseDuration,
        courseLessons: courseLessons ?? this.courseLessons,
        status: status ?? this.status,
        fcmToken: fcmToken ?? this.fcmToken,
        uploaderId: uploaderId ?? this.uploaderId,
        uploaderName: uploaderName ?? this.uploaderName,
        courseFee: courseFee ?? this.courseFee,
        uploaderPicUrl: uploaderPicUrl ?? this.uploaderPicUrl,
        createdAt: createdAt ?? this.createdAt);
  }

  factory SkillsOffered.fromJson(Map<String, dynamic> json) =>
      _$SkillsOfferedFromJson(json);

  Map<String, dynamic> toJson() => _$SkillsOfferedToJson(this);
}
