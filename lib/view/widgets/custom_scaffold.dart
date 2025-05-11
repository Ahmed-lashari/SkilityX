import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final bool isScrollable;
  final double hPadding;
  final double vPadding;
  final Color? backGroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? body;

  const CustomScaffold({
    super.key,
    this.backGroundColor,
    this.hPadding = 10,
    this.vPadding = 0,
    this.appBar,
    this.body,
    this.isScrollable = false,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: widget.backGroundColor,
      appBar: widget.appBar,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.hPadding, vertical: widget.vPadding),
        child: widget.isScrollable
            ? SingleChildScrollView(
                child: widget.body ?? const SizedBox.shrink(),
              )
            : widget.body ?? const SizedBox.shrink(),
      ),
    );
  }
}
