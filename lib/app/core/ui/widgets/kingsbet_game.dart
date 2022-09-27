import 'package:flutter/material.dart';

class KingsbetGame extends StatelessWidget {
  const KingsbetGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 120,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: Colors.white,
      ),
    );
  }
}
