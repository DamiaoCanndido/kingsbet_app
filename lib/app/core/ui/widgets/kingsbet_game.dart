import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KingsbetGame extends StatelessWidget {
  final String homeShield;
  final String awayShield;
  final String homeTeam;
  final String awayTeam;
  final String stadium;
  final DateTime start;
  final String? champ;
  final String? group;
  final int? round;
  const KingsbetGame(
      {super.key,
      required this.homeShield,
      required this.awayShield,
      required this.homeTeam,
      required this.awayTeam,
      required this.stadium,
      required this.start,
      this.champ,
      this.group,
      this.round});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 120,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        color: Color.fromARGB(255, 253, 232, 239),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "$stadium ${DateFormat('dd-MM-yyyy EEE kk:mm').format(
                  start.toLocal(),
                )}",
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                homeShield,
                              ),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            homeTeam,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "3:0",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    )
                  ],
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                awayShield,
                              ),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            awayTeam,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                champ == null
                    ? "amistoso"
                    : "$champ, Grupo $group, Rodada ${round.toString()}",
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
