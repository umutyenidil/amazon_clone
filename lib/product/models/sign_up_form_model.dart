import 'dart:convert';

class SignUpFormModel {
  final String name;
  final String emailAddress;
  final String password;

  SignUpFormModel({
    required this.name,
    required this.emailAddress,
    required this.password,
  });

  SignUpFormModel copyWith({
    String? name,
    String? emailAddress,
    String? password,
  }) =>
      SignUpFormModel(
        name: name ?? this.name,
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
      );

  factory SignUpFormModel.fromJson(String str) => SignUpFormModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignUpFormModel.fromMap(Map<String, dynamic> json) => SignUpFormModel(
    name: json["name"],
    emailAddress: json["emailAddress"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "emailAddress": emailAddress,
    "password": password,
  };
}
