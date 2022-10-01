// To parse this JSON data, do
//
//     final matchModel = matchModelFromMap(jsonString);

import 'dart:convert';

GameModel gameModelFromMap(String str) => GameModel.fromMap(json.decode(str));

String gameModelToMap(GameModel data) => json.encode(data.toMap());

class GameModel {
  GameModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.homeId,
    this.homeScore,
    this.awayId,
    this.awayScore,
    this.roundId,
    this.champId,
    this.playOffs,
    this.homeKickScore,
    this.awayKickScore,
    this.start,
    this.groupId,
    this.home,
    this.away,
    this.champ,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? homeId;
  int? homeScore;
  String? awayId;
  int? awayScore;
  String? roundId;
  String? champId;
  bool? playOffs;
  int? homeKickScore;
  int? awayKickScore;
  DateTime? start;
  int? groupId;
  Team? home;
  Team? away;
  Champ? champ;

  factory GameModel.fromMap(Map<String, dynamic> json) => GameModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        homeId: json["homeId"],
        homeScore: json["homeScore"],
        awayId: json["awayId"],
        awayScore: json["awayScore"],
        roundId: json["roundId"],
        champId: json["champId"],
        playOffs: json["playOffs"],
        homeKickScore: json["homeKickScore"],
        awayKickScore: json["awayKickScore"],
        start: DateTime.parse(json["start"]),
        groupId: json["groupId"],
        home: Team.fromMap(json["home"]),
        away: Team.fromMap(json["away"]),
        champ: json["champ"] != null ? Champ.fromMap(json["champ"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "homeId": homeId,
        "homeScore": homeScore,
        "awayId": awayId,
        "awayScore": awayScore,
        "roundId": roundId,
        "champId": champId,
        "playOffs": playOffs,
        "homeKickScore": homeKickScore,
        "awayKickScore": awayKickScore,
        "start": start!.toIso8601String(),
        "groupId": groupId,
        "home": home!.toMap(),
        "away": away!.toMap(),
        "champ": champ!.toMap(),
      };
}

class Team {
  Team({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.country,
    this.shieldUrl,
    this.shieldKey,
    this.stadium,
    this.teamType,
    this.code,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? country;
  String? shieldUrl;
  String? shieldKey;
  String? stadium;
  String? teamType;
  String? code;

  factory Team.fromMap(Map<String, dynamic> json) => Team(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        country: json["country"],
        shieldUrl: json["shieldUrl"],
        shieldKey: json["shieldKey"],
        stadium: json["stadium"],
        teamType: json["teamType"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "name": name,
        "country": country,
        "shieldUrl": shieldUrl,
        "shieldKey": shieldKey,
        "stadium": stadium,
        "teamType": teamType,
        "code": code,
      };
}

Champ champFromMap(String str) => Champ.fromMap(json.decode(str));

String champToMap(Champ data) => json.encode(data.toMap());

class Champ {
  Champ({
    this.name,
    this.country,
    this.shieldUrl,
  });

  String? name;
  String? country;
  String? shieldUrl;

  factory Champ.fromMap(Map<String, dynamic> json) => Champ(
        name: json["name"],
        country: json["country"],
        shieldUrl: json["shieldUrl"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "country": country,
        "shieldUrl": shieldUrl,
      };
}
