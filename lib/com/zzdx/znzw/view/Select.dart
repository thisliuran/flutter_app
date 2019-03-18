import 'package:flutter/material.dart';

class Select extends Object {
  final Widget inside;
  final String title;
  final Icon icon;
  FloatingActionButton floatButton;
  Select({this.inside, this.title,this.icon,floatButton = null});

}


class SelectPage{
  Map<String,Select> map;


}