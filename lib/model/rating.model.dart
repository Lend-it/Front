import 'package:flutter/widgets.dart';

class RatingModel {
  final int stars;
  final String review;
  final bool report;
  final String reviewer;
  final String reviewed;
  final String requestid;

  RatingModel({
    @required this.stars,
    this.review,
    @required this.report,
    @required this.reviewer,
    @required this.reviewed,
    @required this.requestid,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      stars: json['stars'],
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
