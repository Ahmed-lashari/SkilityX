import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/models/Users/users.dart';
import 'package:skility_x/view-model/data_providers/view/screen/home/2_request_portal/1_sent_requests.dart';
import 'package:skility_x/view/ui_config/view/screens/home/1_skills/3_filter_screen.dart';
import 'package:skility_x/view/widgets/custom_progress_indicator.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/request_card_ui.dart';
import 'package:skility_x/view/widgets/smart_refresher.dart';

class SentRequestsWithRefresher extends ConsumerStatefulWidget {
  final Users user;
  const SentRequestsWithRefresher({super.key, required this.user});

  @override
  ConsumerState<SentRequestsWithRefresher> createState() =>
      _SentRequestsWithRefresherState();
}

class _SentRequestsWithRefresherState
    extends ConsumerState<SentRequestsWithRefresher> {
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

    final paginationState =
        ref.watch(sentRequestsPaginationProvider(widget.user.id));
    final paginationNotifier =
        ref.read(sentRequestsPaginationProvider(widget.user.id).notifier);

    return CustomScaffold(
      body: paginationState.items.isEmpty && paginationState.isLoading
          ? Center(child: GradientCircularProgress())
          : paginationState.items.isEmpty && !paginationState.isLoading
              ? Center(child: Text('No Sent Requests'))
              : CustomRefresherWithPagination(
                  state: paginationState,
                  onLoadMore: () => paginationNotifier.loadMore(),
                  itemBuilder: (context, index, item) {
                    final i =
                        FilterScreenConfig.getColorIndex(index, isList.length);
                    final colorScheme = isList[i];

                    return RequestCard(
                      data: item,
                      colorModel: colorScheme,
                      index: index,
                      showLearningButton: true,
                    );
                  },
                ),
    );
  }
}
