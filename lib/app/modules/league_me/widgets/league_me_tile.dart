import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kingsbet_app/app/core/constants/constants.dart';
import 'package:kingsbet_app/app/models/league_model.dart';
import 'package:kingsbet_app/app/modules/league_me/league_me_controller.dart';

class LeagueMeTile extends GetView<LeagueMeController> {
  final LeagueModel leagueModel;

  const LeagueMeTile({super.key, required this.leagueModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Constants.GAME, arguments: leagueModel);
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
          color: Colors.white,
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
                    flex: 1,
                    child: Text(
                      leagueModel.name,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      DateFormat('dd/MM/yyyy EEE kk:mm').format(
                        leagueModel.start!,
                      ),
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
