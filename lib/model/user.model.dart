import 'package:flutter/widgets.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String whatsapp;
  final String password;
  final String photo;
  final String rating;
  final double latitude;
  final double longitude;

  UserModel({
    this.id = "",
    @required this.name,
    @required this.email,
    this.whatsapp,
    this.password,
    this.photo,
    this.rating,
    this.latitude,
    this.longitude,
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
      latitude: json['latitude'],
      longitude: json['longitude'],
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
      "latitude": this.latitude,
      "longitude": this.longitude,
    };
  }
}
