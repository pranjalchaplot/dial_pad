import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final Widget child;
  @override
  _BackgroundState createState() => _BackgroundState();
  const Background({
    Key key,
    this.child,
  }) : super(key: key);
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
