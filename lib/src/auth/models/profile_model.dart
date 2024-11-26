// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    String authToken;
    User user;

    ProfileModel({
        required this.authToken,
        required this.user,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        authToken: json["auth_token"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "auth_token": authToken,
        "user": user.toJson(),
    };
}

class User {
    String id;
    String username;
    String email;
    String password;
    String role;
    String otpExpiresAt;
    String otp;
    bool verified;
    DateTime createdAt;
    DateTime updatedAt;
    String userId;
    int v;

    User({
        required this.id,
        required this.username,
        required this.email,
        required this.password,
        required this.role,
        required this.otpExpiresAt,
        required this.otp,
        required this.verified,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
        required this.v,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        otpExpiresAt: json["otpExpiresAt"],
        otp: json["otp"],
        verified: json["verified"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "role": role,
        "otpExpiresAt": otpExpiresAt,
        "otp": otp,
        "verified": verified,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userId": userId,
        "__v": v,
    };
}
