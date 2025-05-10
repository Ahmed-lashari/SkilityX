import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final AppBar? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final double hPadding;
  final double vPadding;

  const CustomScaffold(
      {super.key,
      this.appBar,
      this.body,
      this.bottomNavigationBar,
      this.hPadding = 10,
      this.vPadding = 0});

  @override
  State<CustomScaffold> createState() => mymScaffoldState();
}

class mymScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.hPadding, vertical: widget.vPadding),
        child: widget.body,
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
