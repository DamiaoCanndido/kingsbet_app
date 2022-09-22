import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/models/league_model.dart';

class LeagueTile extends StatelessWidget {
  final LeagueModel leagueModel;

  const LeagueTile({super.key, required this.leagueModel});

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
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      leagueModel.name,
                      style: const TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      leagueModel.start!,
                      style: const TextStyle(fontSize: 10),
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
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Entrada: ${leagueModel.subscription.toString()}",
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Jogadores: ${leagueModel.playersAccepted}/${leagueModel.playersAmount}",
                      style: const TextStyle(fontSize: 10),
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
