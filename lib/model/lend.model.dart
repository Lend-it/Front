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
  final UserModel requester;
  final UserModel lender;
  final bool finalized;

  LendModel({
    this.id = "",
    @required this.title,
    @required this.category,
    @required this.description,
    @required this.endDate,
    @required this.startDate,
    @required this.requester,
    @required this.lender,
    @required this.finalized,
  });

  factory LendModel.fromJson(Map<String, dynamic> json) {
    return LendModel(
      id: json["requestid"],
      title: json["productname"],
      description: json["description"],
      endDate: json["enddate"],
      startDate: json["startdate"],
      finalized: json["finalized"],
      category: CategoryModel.fromJson(json),
      lender:
          json["lender"] != null ? UserModel.fromJson(json["lender"]) : null,
      requester: UserModel.fromJson(json["requester"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productname": this.title,
      "startdate": this.startDate,
      "enddate": this.endDate,
      "finalized": this.finalized,
      "description": this.description,
      "productcategoryid": int.parse(this.category.id),
      "lender": this.lender.toJson(),
      "requester": this.requester.toJson(),
    };
  }
}
