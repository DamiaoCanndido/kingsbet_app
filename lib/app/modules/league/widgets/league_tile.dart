import 'package:flutter/material.dart';

class LeagueTile extends StatelessWidget {
  const LeagueTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("CLIQUE");
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
          color: Color.fromARGB(255, 223, 216, 216),
        ),
        height: 100,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "LIGA DOS CAMPEÕES DE MERDA",
                      style: TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "02/10/2022 18:00",
                      style: TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Entrada: Grátis",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Jogadores: 3/5",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
