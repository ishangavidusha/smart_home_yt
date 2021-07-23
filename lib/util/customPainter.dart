
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smart_home_yt/util/appColors.dart';

class ShapePainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint = new Paint()
    ..shader = LinearGradient(
      colors: AppColors.shapeGradeantColors,
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter
    ).createShader(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0;
     
         
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 0);
    path.cubicTo(size.width*0.08,size.height*0.22,size.width*0.40,size.height*0.04,size.width*0.40,size.height*0.35);
    path.lineTo(size.width*0.40,size.height*0.70);
    path.cubicTo(size.width*0.40,size.height*0.82,size.width*0.60,size.height*0.82,size.width*0.60,size.height*0.70);
    path.lineTo(size.width*0.60,size.height*0.35);
    path.cubicTo(size.width*0.60,size.height*0.04,size.width*0.92,size.height*0.22,size.width,0);
    path.lineTo(size.width,size.height);
    path.lineTo(0,size.height);
    path.close();

    canvas.drawShadow(path.shift(Offset(0, -50)), Colors.black.withOpacity(0.2), 30, true);
    canvas.drawPath(path, paint);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
