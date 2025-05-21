import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view-model/data_providers/view/screen/home/2_request_portal/0_receoved_requests.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_progress_indicator.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/request_card_ui.dart';
import 'package:skility_x/view/widgets/smart_refresher.dart';

class ReceivedRequestsWithRefresher extends ConsumerStatefulWidget {
  final Users user;
  const ReceivedRequestsWithRefresher({super.key, required this.user});

  @override
  ConsumerState<ReceivedRequestsWithRefresher> createState() =>
      _ReceivedRequestsState();
}

class _ReceivedRequestsState
    extends ConsumerState<ReceivedRequestsWithRefresher> {
  List<FilterColorModel> isList = [];
  @override
  void initState() {
    super.initState();

    isList = FilterScreenConfig.getColorsLists();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('received request building');
    final paginatedState =
        ref.watch(receivedRequestsPaginationProvider(widget.user.id));
    final paginationNotifier =
        ref.watch(receivedRequestsPaginationProvider(widget.user.id).notifier);
    return CustomScaffold(
      body: CustomScaffold(
          body: paginatedState.items.isEmpty && paginatedState.isLoading
              ? Center(child: GradientCircularProgress())
              : paginatedState.items.isEmpty && !paginatedState.isLoading
                  ? Center(child: Text('No Sent Requests'))
                  : CustomRefresherWithPagination(
                      state: paginatedState,
                      onLoadMore: () => paginationNotifier.loadMore(),
                      itemBuilder: (context, index, item) {
                        final i = FilterScreenConfig.getColorIndex(
                            index, isList.length);
                        final colorScheme = isList[i];

                        return RequestCard(
                            data: item,
                            colorModel: colorScheme,
                            index: index,
                            showLearningButton: true);
                      })),
    );
  }
}
