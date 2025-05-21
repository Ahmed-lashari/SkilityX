import 'package:pull_to_refresh/pull_to_refresh.dart';

class RequestsReceivedAction {
  static Future<void> onLoading(refreshController) async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length + 3).toString());
    // if (mounted) setState(() {});
    refreshController.loadComplete();
  }

  static Future<void> onRefresh(RefreshController refreshController) async {
    await Future.delayed(Duration(milliseconds: 1000));

    refreshController.refreshToIdle();
  }
}
