

import 'package:flutter/material.dart';

/// this component will be a clipper to make container a receipt like
class CustomHalfCircleClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height );
    path.quadraticBezierTo(size.width*(1/6),size.height ,
        size.width*(2/6) , size.height*(4/5));
    path.quadraticBezierTo(size.width*(3/6),size.height ,
        size.width*(4/6) , size.height*(4/5));
    path.quadraticBezierTo(size.width*(5/6),size.height*(4/5),
        size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

/// this component will be a clipper to make container a leaf like
class MyLeafClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final Path path =  Path();
    path.lineTo(0.0, size.height*(3/4) );
   // path.quadraticBezierTo(x1, y1, size.width/2, size.height)
    path.arcToPoint(Offset(size.width/2, size.height),
        radius:Radius.circular(size.width/2) );
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height/4);
    path.arcToPoint(Offset(size.width/2,0),
        radius:Radius.circular(size.width/2) );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}