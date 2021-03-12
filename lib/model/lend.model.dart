import 'package:flutter/widgets.dart';
import 'package:front/model/category.model.dart';
import 'package:front/model/user.model.dart';

class LendModel {
  final int id;
  @required
  final String title;
  @required
  final CategoryModel category;
  @required
  final String description;
  @required
  final String endDate;
  @required
  final String startDate;
  @required
  final UserModel user;

  LendModel({
    this.id,
    this.title,
    this.category,
    this.description,
    this.endDate,
    this.startDate,
    this.user,
  });

  factory LendModel.fromJson(Map<String, dynamic> json) {
    return LendModel(
      id: json["id"],
      title: json["title"],
      category: CategoryModel(
        id: json["category"]["id"],
        title: json["category"]["title"],
      ),
      description: json["description"],
      endDate: json["endDate"],
      startDate: json["startDate"],
      user: UserModel(
        id: json["user"]['id'],
        name: json["user"]['name'],
        photo: json["user"]["photo"],
        rating: json["user"]['rating'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "category": this.category,
      "description": this.description,
      "endDate": this.endDate,
      "startDate": this.startDate,
      "user": this.user,
    };
  }
}
