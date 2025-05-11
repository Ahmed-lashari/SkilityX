import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final bool isScrollable;
  final double hPadding;
  final double vPadding;
  final Color? backGroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final VoidCallback? onDrawerToggle;
  final GlobalKey<ScaffoldState>? externalScaffoldKey;

  const CustomScaffold({
    super.key,
    this.backGroundColor,
    this.hPadding = 10,
    this.vPadding = 0,
    this.appBar,
    this.drawer,
    this.onDrawerToggle,
    this.externalScaffoldKey,
    this.body,
    this.bottomNavigationBar,
    this.isScrollable = false,
  });

  @override
  State<CustomScaffold> createState() => CustomScaffoldState();
}

class CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _internalKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: widget.backGroundColor,
      appBar: widget.appBar,
      drawer: widget.drawer,
      onDrawerChanged: (isOpened) {
        if (widget.onDrawerToggle != null) {
          widget.onDrawerToggle!.call();
        }
      },
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.hPadding, vertical: widget.vPadding),
        child: widget.isScrollable
            ? SingleChildScrollView(
                child: widget.body ?? const SizedBox.shrink(),
              )
            : widget.body ?? const SizedBox.shrink(),
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }

  late final GlobalKey<ScaffoldState> _internalKey;

  void openDrawer() => _internalKey.currentState?.openDrawer();
  void closeDrawer() => _internalKey.currentState?.closeDrawer();

  @override
  void initState() {
    super.initState();

    _internalKey = widget.externalScaffoldKey ?? GlobalKey<ScaffoldState>();
  }
}
