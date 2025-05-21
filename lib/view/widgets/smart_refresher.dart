// 8. If you still want to use the pull-to-refresh functionality with the new pagination
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skility_x/core/utils.dart/paginations.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';

class CustomRefresherWithPagination extends StatefulWidget {
  final BasePaginationState state;
  final Function() onLoadMore;
  final Widget Function(BuildContext context, int index, SkillsRequests item)
      itemBuilder;

  const CustomRefresherWithPagination({
    super.key,
    required this.state,
    required this.onLoadMore,
    required this.itemBuilder,
  });

  @override
  State<CustomRefresherWithPagination> createState() =>
      _CustomRefresherWithPaginationState();
}

class _CustomRefresherWithPaginationState
    extends State<CustomRefresherWithPagination> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: widget.state.hasMore,
      controller: refreshController,
      onLoading: () async {
        await widget.onLoadMore();
        refreshController.loadComplete();
      },
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = const Text("Pull up to load more");
          } else if (mode == LoadStatus.loading) {
            body = const CircularProgressIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text("Load Failed! Click retry.");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("Release to load more");
          } else {
            body = const Text("No more data");
          }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      child: ListView.builder(
        itemCount: widget.state.items.length,
        itemBuilder: (context, index) =>
            widget.itemBuilder(context, index, widget.state.items[index]),
      ),
    );
  }

  @override
  void dispose() {
    refreshController.dispose();
    debugPrint('disposing the refresh controller');
    super.dispose();
  }
}
