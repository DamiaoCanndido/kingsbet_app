// To parse this JSON data, do
//
//     final playerModel = playerModelFromMap(jsonString);

import 'dart:convert';

class PlayerModel {
  PlayerModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.leagueId,
    this.score,
    this.isAlive,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? userId;
  String? leagueId;
  int? score;
  bool? isAlive;

  factory PlayerModel.fromJson(String str) =>
      PlayerModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlayerModel.fromMap(Map<String, dynamic> json) => PlayerModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        leagueId: json["leagueId"],
        score: json["score"],
        isAlive: json["isAlive"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "userId": userId,
        "leagueId": leagueId,
        "score": score,
        "isAlive": isAlive,
      };
}
