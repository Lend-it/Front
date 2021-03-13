import 'package:flutter/widgets.dart';

class CategoryModel {
  final int id;
  @required
  final String title;

  CategoryModel({
    this.id,
    this.title,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
    };
  }
}
