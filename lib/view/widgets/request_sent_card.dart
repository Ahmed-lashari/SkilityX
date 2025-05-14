import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_keys/image_keys.dart';
import 'package:skility_x/core/utils.dart/utils.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/bottom_sheets/sent_request_deletion.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';
import 'package:skility_x/view/widgets/image_ui.dart';

class RequestSentCard extends StatelessWidget {
  final FilterColorModel colorModel;
  final int index;
  final bool showLearningButton;
  final Color? navIconColor;
  const RequestSentCard(
      {required this.colorModel,
      required this.index,
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
            _buildDescription(),

            // course details + request status
            _buildDetails(),

            // user profile, name and navigation
            _builduserInfo(context)
          ],
        ));
  }

  Widget _buildDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // course details
        _buildCourseDetails(),

        // request status and details
        _buildRequestStatus(),
      ],
    );
  }

  Widget _buildCourseDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // days
        Row(
          spacing: 16,
          children: [
            Text(
              '30',
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
              '30',
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

  Widget _buildRequestStatus() {
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
              'Pending',
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
              '12:31 pm',
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

  Widget _builduserInfo(BuildContext context) {
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
                  url: AvatarKeys.cryShaggy,
                ),
                Expanded(
                  child: Text(
                    'Fatima Noman',
                    style: TextStyle(
                        color: colorModel.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Material(
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

  Widget _buildDescription() {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Artificial intelligence',
          style: TextStyle(
              color: colorModel.textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
        ),
        Text(
          'I am an Artificial Inteligence Engineer and willing to help beginners or fresh developer into building Ai models. Feel free to reach me out using the provided deep links.',
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
