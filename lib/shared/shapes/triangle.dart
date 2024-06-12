import 'package:flutter/material.dart';

class TriangleShape extends StatelessWidget {
  final Color? color;
  final double size;

  const TriangleShape({
    super.key,
    this.color,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 1),
      child: ClipPath(
        clipper: TriangleClipper(),
        child: Container(
          color: color,
          height: size,
          width: size,
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
