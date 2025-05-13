import 'package:flutter/material.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/request_sent_card.dart';
import 'package:skility_x/view/widgets/smart_refresher.dart';

class SentRequests extends StatefulWidget {
  const SentRequests({super.key});

  @override
  State<SentRequests> createState() => _ReceivedRequestsState();
}

class _ReceivedRequestsState extends State<SentRequests> {
  List<FilterColorModel> isList = [];
  @override
  void initState() {
    super.initState();

    isList = FilterScreenConfig.getColorsLists();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('sent request building');
    return CustomScaffold(
      hPadding: 0,
      body: CustomRefresher(
          items: items,
          loadingRefreshKey: "sent",
          itemBuilder: (context, index, it) {
            final i = FilterScreenConfig.getColorIndex(index, isList.length);

            final colorScheme = isList[i];
            return RequestSentCard(
                colorModel: colorScheme,
                index: index,
                showLearningButton: true);
          }),
    );
  }

  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
}
