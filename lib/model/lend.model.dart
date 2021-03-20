import 'package:flutter/widgets.dart';
import 'package:front/model/category.model.dart';
import 'package:front/model/user.model.dart';

class LendModel {
  final String id;
  final String title;
  final CategoryModel category;
  final String description;
  final String endDate;
  final String startDate;
  final UserModel user;

  LendModel({
    this.id = "",
    @required this.title,
    @required this.category,
    @required this.description,
    @required this.endDate,
    @required this.startDate,
    @required this.user,
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
        email: json["user"]['email'],
        photo: json["user"]["photo"],
        rating: json["user"]['rating'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productname": this.title,
      "startdate": this.startDate,
      "enddate": this.endDate,
      "description": this.description,
      "requester": this.user.email,
      "productcategoryid": int.parse(this.category.id),
    };
  }
}
