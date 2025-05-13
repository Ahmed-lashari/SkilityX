import 'package:flutter/material.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_widgets.dart';

class BottomSheetReceivedReq extends StatelessWidget {
  final FilterColorModel colorModel;
  const BottomSheetReceivedReq({super.key, required this.colorModel});

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: CustomWidgets.actionButton(
                  backgroundColor: colorModel.textColor,
                  textColor: colorModel.boxColor,
                  label: 'Accept',
                  onPressed: () {}),
            ),
          ],
        )
      ],
    );
  }
}
