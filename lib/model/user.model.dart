import 'package:flutter/widgets.dart';

class UserModel {
  final int id;
  @required
  final String name;
  @required
  final String photo;
  @required
  final String rating;

  UserModel({
    this.id,
    this.name,
    this.photo,
    this.rating,
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
