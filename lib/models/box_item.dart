import 'package:flutter/material.dart';

class BoxItem {
  final String title;
  final String text;
  bool expanded;

  BoxItem({@required this.title, @required this.text, this.expanded = false});
  
}
