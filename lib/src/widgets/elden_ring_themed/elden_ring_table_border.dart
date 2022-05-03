import 'package:flutter/cupertino.dart';

class EldenRingTableBorder extends TableBorder {

  @override 
  void paint(Canvas canvas, Rect rect, {required Iterable<double> rows, required Iterable<double> columns}) {
    super.paint(canvas, rect, rows: rows, columns: columns);
  }
}