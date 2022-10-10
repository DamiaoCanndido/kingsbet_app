// To parse this JSON data, do
//
//     final predictModel = predictModelFromMap(jsonString);

import 'dart:convert';

class PredictModel {
  PredictModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.leagueId,
    this.matchId,
    this.playerId,
    this.homePredict,
    this.awayPredict,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? leagueId;
  String? matchId;
  String? playerId;
  int? homePredict;
  int? awayPredict;

  factory PredictModel.fromJson(String str) =>
      PredictModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PredictModel.fromMap(Map<String, dynamic> json) => PredictModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        leagueId: json["leagueId"],
        matchId: json["matchId"],
        playerId: json["playerId"],
        homePredict: json["homePredict"],
        awayPredict: json["awayPredict"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "leagueId": leagueId,
        "matchId": matchId,
        "playerId": playerId,
        "homePredict": homePredict,
        "awayPredict": awayPredict,
      };
}
