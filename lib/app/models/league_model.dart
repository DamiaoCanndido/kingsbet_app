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
    required this.matchesAmount,
    this.subscription,
    this.isPrivate,
    this.start,
    this.gamesOnLeagues,
  });

  String? id;
  String name;
  int playersAmount;
  int? playersAccepted;
  int matchesAmount;
  int? subscription;
  bool? isPrivate;
  DateTime? start;
  List<GamesOnLeague>? gamesOnLeagues;

  factory LeagueModel.fromMap(Map<String, dynamic> json) => LeagueModel(
        id: json["id"],
        name: json["name"],
        playersAmount: json["playersAmount"],
        playersAccepted: json["playersAccepted"],
        matchesAmount: json["matchesAmount"],
        subscription: json["subscription"],
        isPrivate: json["isPrivate"],
        start: DateTime.parse(json["start"]),
        gamesOnLeagues: List<GamesOnLeague>.from(
          json["gamesOnLeagues"].map(
            (x) => GamesOnLeague.fromMap(x),
          ),
        ),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "playersAmount": playersAmount,
        "playersAccepted": playersAccepted,
        "matchesAmount": matchesAmount,
        "subscription": subscription,
        "isPrivate": isPrivate,
        "start": start!.toIso8601String(),
        "gamesOnLeagues": List<dynamic>.from(
          gamesOnLeagues!.map(
            (x) => x.toMap(),
          ),
        ),
      };
}

class GamesOnLeague {
  GamesOnLeague({
    this.game,
  });

  Game? game;

  factory GamesOnLeague.fromMap(Map<String, dynamic> json) => GamesOnLeague(
        game: Game.fromMap(json["game"]),
      );

  Map<String, dynamic> toMap() => {
        "game": game!.toMap(),
      };
}

class Game {
  Game({
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
  String? groupId;

  factory Game.fromMap(Map<String, dynamic> json) => Game(
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
      };
}
