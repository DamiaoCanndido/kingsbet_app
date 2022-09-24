// To parse this JSON data, do
//
//     final phaseModel = phaseModelFromMap(jsonString);

import 'dart:convert';

PhaseModel phaseModelFromMap(String str) =>
    PhaseModel.fromMap(json.decode(str));

String phaseModelToMap(PhaseModel data) => json.encode(data.toMap());

class PhaseModel {
  PhaseModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.order,
    this.name,
    required this.leagueId,
    required this.matchesAmount,
    this.fullMatches,
    this.isPlayOffs,
    required this.playerKickAmount,
    this.isAvailable,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? order;
  String? name;
  String leagueId;
  int matchesAmount;
  int? fullMatches;
  bool? isPlayOffs;
  int playerKickAmount;
  bool? isAvailable;

  factory PhaseModel.fromMap(Map<String, dynamic> json) => PhaseModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        order: json["order"],
        name: json["name"],
        leagueId: json["leagueId"],
        matchesAmount: json["matchesAmount"],
        fullMatches: json["fullMatches"],
        isPlayOffs: json["isPlayOffs"],
        playerKickAmount: json["playerKickAmount"],
        isAvailable: json["isAvailable"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "order": order,
        "name": name,
        "leagueId": leagueId,
        "matchesAmount": matchesAmount,
        "fullMatches": fullMatches,
        "isPlayOffs": isPlayOffs,
        "playerKickAmount": playerKickAmount,
        "isAvailable": isAvailable,
      };
}
