import 'dart:convert';

class SignInFormModel {
  final String emailAddress;
  final String password;

  SignInFormModel({
    required this.emailAddress,
    required this.password,
  });

  SignInFormModel copyWith({
    String? emailAddress,
    String? password,
  }) =>
      SignInFormModel(
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
      );

  factory SignInFormModel.fromJson(String str) => SignInFormModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignInFormModel.fromMap(Map<String, dynamic> json) => SignInFormModel(
    emailAddress: json["emailAddress"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "emailAddress": emailAddress,
    "password": password,
  };
}
