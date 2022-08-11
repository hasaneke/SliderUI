import 'package:flutter/material.dart';

class ProjectPaddings {
  static EdgeInsets horizontalSymtericPadding = const EdgeInsets.symmetric(horizontal: 15);
  static EdgeInsets verticalPadding = const EdgeInsets.only(top: 25);
}

class ProjectTabs {
  static List<Widget> tabs = <Widget>[
    const Tab(
      child: Text("Discover"),
    ),
    const Tab(
      child: Text("Brands"),
    ),
    const Tab(
      child: Text("Topics"),
    ),
    const Tab(
      child: Text("Top charts"),
    ),
    const Tab(
      child: Text("Joined"),
    ),
  ];
}
