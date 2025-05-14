import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/view-model/action_controllers.dart/view/auth/toggle_button.dart';
import 'package:skility_x/view/screens/home/2_request_portal/0_receeived_requests.dart';
import 'package:skility_x/view/screens/home/2_request_portal/1_sent_requests.dart';
import 'package:skility_x/view/widgets/custom_scaffold.dart';
import 'package:skility_x/view/widgets/keep_alive_wrapper.dart';

class mySkills extends ConsumerStatefulWidget {
  const mySkills({super.key});

  @override
  ConsumerState<mySkills> createState() => _mySkillsState();
}

class _mySkillsState extends ConsumerState<mySkills> {
  final receivedRequests = KeepAliveWrapper(child: ReceivedRequests());
  final sentRequests = KeepAliveWrapper(child: SentRequests());
  @override
  Widget build(BuildContext context) {
    debugPrint('building skills offers screen');
    return CustomScaffold(
      hPadding: 0,
      isScrollable: !true,
      body: _buildPageView(),
    );
  }

  Widget _buildPageView() {
    return PageView(
        controller: ref.read(filterPageController),
        onPageChanged: (index) => ref
            .read(filterPageController.notifier)
            .onPageChanged(index, ref, false),
        children: [receivedRequests, sentRequests]);
  }
}
