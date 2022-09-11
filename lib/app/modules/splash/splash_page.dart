import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFA40734),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/qatar_wc.png",
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
            const Align(
              child: Text(
                "KING´SBET",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
