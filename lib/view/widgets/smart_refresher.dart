import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skility_x/models/SkillsRequests/skills_requests.dart';
import 'package:skility_x/view-model/action_controllers.dart/view/screens/home/2_request_portal/0_request_received.dart';
import 'package:skility_x/view-model/action_controllers.dart/view/screens/home/2_request_portal/1_request_sent.dart';

class CustomRefresher extends StatefulWidget {
  final List<SkillsRequests> items;
  final Widget Function(BuildContext context, int index, SkillsRequests item)
      itemBuilder;
  final String loadingRefreshKey;

  const CustomRefresher({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.loadingRefreshKey,
  });

  @override
  State<CustomRefresher> createState() => _CustomRefresherState();
}

class _CustomRefresherState extends State<CustomRefresher> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: refreshController,
      onRefresh: refreshFunc,
      onLoading: loadingFunc,
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
        itemCount: widget.items.length,
        itemBuilder: (context, index) =>
            widget.itemBuilder(context, index, widget.items[index]),
      ),
    );
  }

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> loadingFunc() async {
    if (widget.loadingRefreshKey == "received") {
      await RequestsReceivedAction.onLoading(refreshController);
    } else if (widget.loadingRefreshKey == "sent") {
      await RequestsSentAction.onLoading(refreshController);
    } else {
      log('incorrect key passwed to the smart_refresher');
    }
  }

  Future<void> refreshFunc() async {
    if (widget.loadingRefreshKey == "received") {
      await RequestsReceivedAction.onRefresh(refreshController);
    } else if (widget.loadingRefreshKey == "sent") {
      await RequestsSentAction.onRefresh(refreshController);
    } else {
      log('incorrect key passwed to the smart_refresher');
    }
  }

  @override
  void dispose() {
    refreshController.dispose();
    debugPrint('disposing the refresh cotroller');
    super.dispose();
  }
}
