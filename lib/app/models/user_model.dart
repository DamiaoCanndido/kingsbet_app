// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromMap(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toMap());

class UserModel {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String name;
  String email;
  String? password;
  String? confirmPassword;
  String? accessToken;
  bool? isAdmin;

  UserModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    required this.name,
    required this.email,
    this.password,
    this.confirmPassword,
    this.accessToken,
    this.isAdmin,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        accessToken: json["access_token"],
        isAdmin: json["isAdmin"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "access_token": accessToken,
        "isAdmin": isAdmin,
      };
}
