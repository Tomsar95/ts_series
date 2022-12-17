import 'package:flutter/material.dart';

MaterialPageRoute defaultRoute<T extends Widget>(T child) {
  return MaterialPageRoute<T>(builder: (BuildContext context) => child);
}