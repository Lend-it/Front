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
      id: json['useremail'],
      name: json['name'],
      email: json['useremail'],
      whatsapp: json['whatsappnumber'],
      password: json['password'],
      photo:
          'https://avatars.githubusercontent.com/u/42722634?s=460&u=5dc66aaf59dbaf2e3e68c931cca641a44b5fd9fc&v=4',
      rating: '4.5',
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
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
