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
    this.player,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? leagueId;
  String? matchId;
  String? playerId;
  int? homePredict;
  int? awayPredict;
  Player? player;

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
        player: json["player"] != null ? Player.fromMap(json["player"]) : null,
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
        "player": player!.toMap(),
      };
}

class Player {
  Player({
    this.user,
  });

  User? user;

  factory Player.fromMap(Map<String, dynamic> json) => Player(
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user!.toMap(),
      };
}

class User {
  User({
    this.name,
  });

  String? name;

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
