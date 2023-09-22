import 'package:flutter/material.dart';

class VWLoader extends StatelessWidget {
  const VWLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        semanticsLabel: 'Circular progress indicator',
      ),
    );
  }
}
