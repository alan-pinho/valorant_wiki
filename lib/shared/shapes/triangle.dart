import 'package:flutter/material.dart';

class TriangleShape extends StatelessWidget {
  final Color? color;

  const TriangleShape({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 1),
      child: ClipPath(
        clipper: TriangleClipper(),
        child: Container(
          color: color,
          height: 80,
          width: 80,
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
