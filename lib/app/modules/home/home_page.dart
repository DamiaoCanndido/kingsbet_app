import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KingsbetAppBar(
        elevation: 0,
        title: const Text("KINGSBET"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shield_outlined),
            label: "Ligas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shield_rounded),
            label: "Minhas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: "Sair",
          ),
        ],
        onTap: (value) {},
        currentIndex: 0,
      ),
      body: Container(),
    );
  }
}
