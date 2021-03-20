import 'package:flutter/widgets.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String whatsapp;
  final String password;
  final String photo;
  final String rating;

  UserModel({
    this.id = "",
    @required this.name,
    @required this.email,
    @required this.whatsapp,
    @required this.password,
    this.photo,
    this.rating,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      whatsapp: json['whatsapp'],
      password: json['password'],
      photo: json['photo'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "useremail": this.email,
      "whatsappnumber": this.whatsapp,
      "password": this.password,
      "photo": this.photo,
      "rating": this.rating,
    };
  }
}
