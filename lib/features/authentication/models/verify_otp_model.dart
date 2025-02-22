// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromJson(jsonString);

import "dart:convert";

VerifyOtpModel verifyOtpModelFromJson(String str) =>
    VerifyOtpModel.fromJson(json.decode(str));

String verifyOtpModelToJson(VerifyOtpModel data) => json.encode(data.toJson());

class VerifyOtpModel {
  final Tokens tokens;
  final User user;

  VerifyOtpModel({
    required this.tokens,
    required this.user,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) => VerifyOtpModel(
        tokens: Tokens.fromJson(json["tokens"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "tokens": tokens.toJson(),
        "user": user.toJson(),
      };
}

class Tokens {
  final String accessToken;
  final String refreshToken;

  Tokens({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}

class User {
  final String uuid;
  final String name;
  final String email;
  final dynamic googleId;
  final DateTime lastLogin;
  final dynamic bio;
  final String role;
  final int dailyGoal;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.uuid,
    required this.name,
    required this.email,
    required this.googleId,
    required this.lastLogin,
    required this.bio,
    required this.role,
    required this.dailyGoal,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        uuid: json["UUID"],
        name: json["Name"],
        email: json["Email"],
        googleId: json["GoogleID"],
        lastLogin: DateTime.parse(json["LastLogin"]),
        bio: json["Bio"],
        role: json["Role"],
        dailyGoal: json["DailyGoal"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "UUID": uuid,
        "Name": name,
        "Email": email,
        "GoogleID": googleId,
        "LastLogin": lastLogin.toIso8601String(),
        "Bio": bio,
        "Role": role,
        "DailyGoal": dailyGoal,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
      };
}
