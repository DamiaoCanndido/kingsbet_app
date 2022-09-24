// To parse this JSON data, do
//
//     final league = leagueFromMap(jsonString);

import 'dart:convert';

LeagueModel leagueFromMap(String str) => LeagueModel.fromMap(json.decode(str));

String leagueToMap(LeagueModel data) => json.encode(data.toMap());

class LeagueModel {
  LeagueModel({
    this.id,
    required this.name,
    required this.playersAmount,
    this.playersAccepted,
    required this.phasesAmount,
    required this.matchesAmount,
    this.subscription,
    this.isPrivate,
    this.start,
  });

  String? id;
  String name;
  int playersAmount;
  int? playersAccepted;
  int phasesAmount;
  int matchesAmount;
  int? subscription;
  bool? isPrivate;
  DateTime? start;

  factory LeagueModel.fromMap(Map<String, dynamic> json) => LeagueModel(
        id: json["id"],
        name: json["name"],
        playersAmount: json["playersAmount"],
        playersAccepted: json["playersAccepted"],
        phasesAmount: json["phasesAmount"],
        matchesAmount: json["matchesAmount"],
        subscription: json["subscription"],
        isPrivate: json["isPrivate"],
        start: DateTime.parse(json["start"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "playersAmount": playersAmount,
        "playersAccepted": playersAccepted,
        "phasesAmount": phasesAmount,
        "matchesAmount": matchesAmount,
        "subscription": subscription,
        "isPrivate": isPrivate,
        "start": start!.toIso8601String(),
      };
}
