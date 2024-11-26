import 'dart:convert';

AcessTokenModel acessTokenModelFromJson(String str) => AcessTokenModel.fromJson(json.decode(str));

String acessTokenModelToJson(AcessTokenModel data) => json.encode(data.toJson());

class AcessTokenModel {
    String authToken;

    AcessTokenModel({
        required this.authToken,
    });

    factory AcessTokenModel.fromJson(Map<String, dynamic> json) => AcessTokenModel(
        authToken: json["auth_token"],
    );

    Map<String, dynamic> toJson() => {
        "auth_token": authToken,
    };
}
