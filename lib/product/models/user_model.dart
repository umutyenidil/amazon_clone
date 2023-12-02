import 'dart:convert';

class UserModel {
  final String name;
  final String emailAddress;
  final String password;
  final String address;
  final String type;
  final String id;
  final String? token;

  UserModel({
    required this.name,
    required this.emailAddress,
    required this.password,
    required this.address,
    required this.type,
    required this.id,
    this.token,
  });

  UserModel copyWith({
    String? name,
    String? emailAddress,
    String? password,
    String? address,
    String? type,
    String? id,
  }) =>
      UserModel(
        name: name ?? this.name,
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
        address: address ?? this.address,
        type: type ?? this.type,
        id: id ?? this.id,
      );

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        name: json["name"] ?? '',
        emailAddress: json["emailAddress"] ?? '',
        password: json["password"] ?? '',
        address: json["address"] ?? '',
        type: json["type"] ?? '',
        id: json["_id"] ?? '',
        token: json["token"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "emailAddress": emailAddress,
        "password": password,
        "address": address,
        "type": type,
        "_id": id,
      };
}
