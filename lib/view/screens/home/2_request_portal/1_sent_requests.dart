import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view-model/data_providers/view/screen/home/2_request_portal/1_sent_requests.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_progress_indicator.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/request_sent_card.dart';
import 'package:skility_x/view/widgets/smart_refresher.dart';

class SentRequests extends ConsumerStatefulWidget {
  final Users user;
  const SentRequests({super.key, required this.user});

  @override
  ConsumerState<SentRequests> createState() => _ReceivedRequestsState();
}

class _ReceivedRequestsState extends ConsumerState<SentRequests> {
  List<FilterColorModel> isList = [];
  @override
  void initState() {
    super.initState();

    isList = FilterScreenConfig.getColorsLists();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.user.id);
    debugPrint('sent request building');
    final data = ref.watch(sentRequestProvider(widget.user.id));
    return CustomScaffold(
        body: data.when(
      loading: () => Center(child: GradientCircularProgress()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      data: (data) {
        if (data.isEmpty) {
          return Center(child: Text('No Sent Requests'));
        }
        return CustomRefresher(
            items: data,
            loadingRefreshKey: "sent",
            itemBuilder: (context, index, it) {
              final i = FilterScreenConfig.getColorIndex(index, isList.length);

              final colorScheme = isList[i];
              return RequestSentCard(
                  data: data[index],
                  colorModel: colorScheme,
                  index: index,
                  showLearningButton: true);
            });
      },
    ));
  }
}
