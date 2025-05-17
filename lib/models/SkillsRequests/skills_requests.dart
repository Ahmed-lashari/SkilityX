import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skills_requests.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class SkillsRequests {
  @HiveField(0)
  final String requestId;
  @HiveField(1)
  final String fromUserId;
  @HiveField(2)
  final String toUserId;
  @HiveField(3)
  final String skillsOffered;
  @HiveField(4)
  final String message;
  @HiveField(5)
  final String status;
  @HiveField(6)
  final String createdAt;
  @HiveField(7)
  final String senderName;
  @HiveField(8)
  final String receiverName;
  @HiveField(9)
  final String senderMainSkill;
  @HiveField(10)
  final String receiverMainName;
  @HiveField(11)
  final String senderContactNumber;
  @HiveField(12)
  final String fcmToken;
  @HiveField(13)
  final String senderPicUrl;

  const SkillsRequests(
      {required this.requestId,
      required this.fromUserId,
      required this.toUserId,
      required this.skillsOffered,
      required this.message,
      required this.status,
      required this.createdAt,
      required this.senderName,
      required this.receiverName,
      required this.senderMainSkill,
      required this.senderContactNumber,
      required this.fcmToken,
      required this.senderPicUrl,
      required this.receiverMainName});

  SkillsRequests copyWith(
    final String? requestId,
    final String? fromUserId,
    final String? toUserId,
    final String? skillsOffered,
    final String? message,
    final String? status,
    final String? createdAt,
    final String? senderName,
    final String? receiverName,
    final String? senderMainSkill,
    final String? receiverMainName,
    final String? senderContactNumber,
    final String? fcmToken,
    final String? senderPicUrl,
  ) {
    return SkillsRequests(
        requestId: requestId ?? this.requestId,
        fromUserId: fromUserId ?? this.fromUserId,
        toUserId: toUserId ?? this.toUserId,
        skillsOffered: skillsOffered ?? this.skillsOffered,
        message: message ?? this.message,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        senderName: senderName ?? this.senderName,
        receiverName: receiverName ?? this.receiverName,
        senderMainSkill: senderMainSkill ?? this.senderMainSkill,
        senderContactNumber: senderContactNumber ?? this.senderContactNumber,
        fcmToken: fcmToken ?? this.fcmToken,
        senderPicUrl: senderPicUrl ?? this.senderPicUrl,
        receiverMainName: receiverMainName ?? this.receiverMainName);
  }

  factory SkillsRequests.fromJson(Map<String, dynamic> json) =>
      _$SkillsRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$SkillsRequestsToJson(this);
}
