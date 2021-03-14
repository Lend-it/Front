import 'package:flutter/widgets.dart';

class UserModel {
  final String id;
  final String name;
  final String photo;
  final String rating;

  UserModel({
    this.id = "",
    @required this.name,
    @required this.photo,
    @required this.rating,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "photo": this.photo,
      "rating": this.rating,
    };
  }
}
