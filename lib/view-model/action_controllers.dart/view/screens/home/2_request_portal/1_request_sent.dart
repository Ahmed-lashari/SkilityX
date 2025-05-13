class RequestsSentAction {
  static Future<void> onLoading(refreshController) async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length + 3).toString());
    // if (mounted) setState(() {});
    refreshController.loadComplete();
  }

  static Future<void> onRefresh(refreshController) async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // // refreshFailed()
    refreshController.refreshToIdle();
  }
}
