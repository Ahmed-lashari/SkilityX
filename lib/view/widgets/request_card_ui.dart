import 'package:flutter/material.dart';
import 'package:skility_x/constants/app-icons.dart';
import 'package:skility_x/core/utils.dart/time_formats.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/data_source/remote/Firebase/firebase_manager.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/bottom_sheets/received_request_status.dart';
import 'package:skility_x/view/widgets/bottom_sheets/sent_request_deletion.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

class RequestCard extends StatelessWidget {
  final FilterColorModel colorModel;
  final SkillsRequests data;
  final int index;
  final bool showLearningButton;
  final Color? navIconColor;
  const RequestCard(
      {required this.colorModel,
      required this.index,
      required this.data,
      this.navIconColor,
      this.showLearningButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Utils.getWeidth(context),
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorModel.boxColor,
        ),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // course description
            _buildDescription(data),

            // course details + request status
            _buildDetails(data),

            // user profile, name and navigation
            _builduserInfo(context, data)
          ],
        ));
  }

  Widget _buildDetails(SkillsRequests data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // course details
        _buildCourseDetails(data),

        // request status and details
        _buildRequestStatus(data),
      ],
    );
  }

  Widget _buildCourseDetails(SkillsRequests data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // days
        Row(
          spacing: 16,
          children: [
            Text(
              data.courseDuration,
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Days',
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),

        // lessons
        Row(
          spacing: 16,
          children: [
            Text(
              data.courseLessons,
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Lessons',
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRequestStatus(SkillsRequests data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // days
        Row(
          spacing: 16,
          children: [
            Text(
              'Status',
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            ),
            Text(
              data.status,
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),

        // lessons
        Row(
          spacing: 16,
          children: [
            Text(
              'Sent At',
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            ),
            Text(
              TimeFormater.formatTimestamp(data.createdAt),
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorModel.textColor,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _builduserInfo(BuildContext context, SkillsRequests data) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: colorModel.textColor.withAlpha(50),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              spacing: 10,
              children: [
                ProfilePicture(
                  imageSize: 50,
                  url: "${data.receiverPicUrl}",
                ),
                Expanded(
                  child: Text(
                    data.receiverName,
                    style: TextStyle(
                        color: colorModel.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          (data.fromUserId != FirebaseManager.user?.uid)
              ? IconButton(
                  onPressed: () => CustomWidgets.customBottomSheet(
                      context,
                      BottomSheetReceivedReq(colorModel: colorModel),
                      colorModel.boxColor),
                  icon: CustomIcon(
                    icon: AppImageIcons.rightarrow,
                    color: colorModel.textColor,
                    iconSize: 23,
                  ))
              : Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () => CustomWidgets.customBottomSheet(
                        context,
                        BottomSheetSentReqDel(colorModel: colorModel),
                        colorModel.boxColor),
                    borderRadius: BorderRadius.circular(16),
                    splashColor: colorModel.textColor,
                    child: Ink(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: colorModel.boxColor,
                        ),
                        child: Center(
                            child: Text(
                          'Delete Request',
                          style: TextStyle(color: colorModel.textColor),
                        ))),
                  ),
                )
        ],
      ),
    );
  }

  Widget _buildDescription(SkillsRequests data) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.skillsOffered,
          style: TextStyle(
              color: colorModel.textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
        ),
        Text(
          data.message,
          maxLines: 4,
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: colorModel.textColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
