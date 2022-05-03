
import 'package:flutter/cupertino.dart';

class EldenRingBoxBorder extends BoxBorder {
  
  final BorderSide _borders;
  
  EldenRingBoxBorder([double width = 3.0, Color color = const Color.fromARGB(255, 168, 151, 112)]) : _borders = BorderSide(width: width, color: color);
  const EldenRingBoxBorder._(BorderSide borderSide) : _borders = borderSide;

  @override
  BorderSide get bottom => _borders;
  
  @override
  BorderSide get top => _borders;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(_borders.width);

  @override
  bool get isUniform => true;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection, BoxShape shape = BoxShape.rectangle, BorderRadius? borderRadius}) {
    assert(shape != BoxShape.circle, "This widget doesnt support cicle shaped border");

    if(borderRadius != null) {
      paintBorderWithRadius(canvas, rect, borderRadius);
      return;
    }
    
    final Paint paint = Paint()
      ..color = _borders.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.0;
    final Rect outer = rect.inflate(_borders.width - _borders.width * 0.40);
    final Rect inner = rect;
    final Path path = Path();

    paint.strokeWidth = _borders.width * 0.20;
    path.addRect(inner);
    canvas.drawPath(path, paint);

    paint.strokeWidth = _borders.width * 0.40;
    path.reset();
    path.addRect(outer);
    canvas.drawPath(path, paint);
  }

  void paintBorderWithRadius(Canvas canvas, Rect rect, BorderRadius borderRadius) {
   final Paint paint = Paint()
      ..color = _borders.color;
      
    final double width = _borders.width;

    RRect outer = borderRadius.toRRect(rect).inflate(_borders.width);
    RRect inner = outer.deflate(width * 0.40);
    canvas.drawDRRect(outer, inner, paint);

    inner = outer.deflate(width);
    outer = inner.inflate(width * 0.20);
    canvas.drawDRRect(outer, inner, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return EldenRingBoxBorder._(_borders.scale(t));
  }
}