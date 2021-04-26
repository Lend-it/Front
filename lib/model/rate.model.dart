import 'package:flutter/widgets.dart';

class RateModel {
  final int stars;
  final String review;
  final bool report;
  final String reviewer;
  final String reviewed;
  final String requestid;

  RateModel({
    @required this.stars,
    this.review,
    @required this.report,
    @required this.reviewer,
    @required this.reviewed,
    @required this.requestid,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) {
    int stars;

    if (json['stars'] is int) {
      stars = json['stars'];
    } else {
      double doubleStars = json['stars'];
      stars = doubleStars.toInt();
    }

    return RateModel(
      stars: stars,
      review: json['review'],
      report: json['report'],
      reviewer: json['reviewer'],
      reviewed: json['reviewed'],
      requestid: json['requestid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stars': this.stars,
      'review': this.review,
      'report': this.report,
      'reviewer': this.reviewer,
      'reviewed': this.reviewed,
      'requestid': this.requestid,
    };
  }
}
