// To parse this JSON data, do
//
//     final tableModel = tableModelFromMap(jsonString);

import 'dart:convert';

TableModel tableModelFromMap(String str) =>
    TableModel.fromMap(json.decode(str));

String tableModelToMap(TableModel data) => json.encode(data.toMap());

class TableModel {
  TableModel({
    this.player,
    this.points,
  });

  String? player;
  int? points;

  factory TableModel.fromMap(Map<String, dynamic> json) => TableModel(
        player: json["player"],
        points: json["points"],
      );

  Map<String, dynamic> toMap() => {
        "player": player,
        "points": points,
      };
}
