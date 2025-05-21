import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view-model/data_providers/view/screen/home/2_request_portal/0_receoved_requests.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_progress_indicator.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/request_received_card.dart';
import 'package:skility_x/view/widgets/smart_refresher.dart';

class ReceivedRequests extends ConsumerStatefulWidget {
  final Users user;
  const ReceivedRequests({super.key, required this.user});

  @override
  ConsumerState<ReceivedRequests> createState() => _ReceivedRequestsState();
}

class _ReceivedRequestsState extends ConsumerState<ReceivedRequests> {
  List<FilterColorModel> isList = [];
  @override
  void initState() {
    super.initState();

    isList = FilterScreenConfig.getColorsLists();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('received request building');
    final data = ref.watch(receivedRequestProvider(widget.user.id));
    return CustomScaffold(
        body: data.when(
      loading: () => Center(child: GradientCircularProgress()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      data: (data) {
        if (data.isEmpty) {
          return Center(child: Text('No Received Requests'));
        }
        return CustomRefresher(
            items: data,
            loadingRefreshKey: "sent",
            itemBuilder: (context, index, it) {
              final i = FilterScreenConfig.getColorIndex(index, isList.length);

              final colorScheme = isList[i];
              return RequestReceivedCard(
                  data: data[index],
                  colorModel: colorScheme,
                  index: index,
                  showLearningButton: true);
            });
      },
    ));
  }
}
