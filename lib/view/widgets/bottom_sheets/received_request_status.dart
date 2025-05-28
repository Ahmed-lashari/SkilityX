import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';
import 'package:skility_x/view-model/action_controllers.dart/view/screens/home/2_request_portal/0_request_received.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class BottomSheetReceivedReq extends ConsumerWidget {
  final FilterColorModel colorModel;
  final SkillsRequests reqDoc;
  const BottomSheetReceivedReq(
      {super.key, required this.colorModel, required this.reqDoc});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 10,
      children: [
        Text(
          'Request Status',
          style: TextStyle(
              color: colorModel.textColor,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: CustomWidgets.actionButton(
                  backgroundColor: colorModel.textColor.withAlpha(100),
                  textColor: colorModel.textColor,
                  label: 'Reject',
                  onPressed: () => AppNavigator.navigateBack(context)),
            ),

            // make changes in the doc and then display the sender email. and receiver email to sender as well
            Expanded(
              child: CustomWidgets.actionButton(
                  backgroundColor: colorModel.textColor,
                  textColor: colorModel.boxColor,
                  label: 'Accept',
                  onPressed: () => RequestsReceivedAction.acceptRequest(
                      context, ref, reqDoc)),
            ),
          ],
        )
      ],
    );
  }
}
