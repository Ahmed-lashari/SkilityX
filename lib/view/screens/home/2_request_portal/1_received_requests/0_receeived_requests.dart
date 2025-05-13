import 'package:flutter/material.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/request_received_card.dart';
import 'package:skility_x/view/widgets/smart_refresher.dart';

class ReceivedRequests extends StatefulWidget {
  const ReceivedRequests({super.key});

  @override
  State<ReceivedRequests> createState() => _ReceivedRequestsState();
}

class _ReceivedRequestsState extends State<ReceivedRequests> {
  List<FilterColorModel> isList = [];
  @override
  void initState() {
    super.initState();

    isList = FilterScreenConfig.getColorsLists();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('received request building');
    return CustomScaffold(
      hPadding: 0,
      body: CustomRefresher(
          items: items,
          loadingRefreshKey: "received",
          itemBuilder: (context, index, it) {
            final i = FilterScreenConfig.getColorIndex(index, isList.length);

            final colorScheme = isList[i];
            return RequestReceivedCard(
                colorModel: colorScheme,
                index: index,
                showLearningButton: true);
          }),
    );
  }

  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
}
