import 'package:flutter/material.dart';

class LeagueTile extends StatelessWidget {
  const LeagueTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.amber,
        margin: const EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
        ),
        height: 80,
      ),
    );
  }
}
