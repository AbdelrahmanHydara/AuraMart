import 'package:shopx/core/entity/review_entity.dart';

class ReviewModel {
  final String reviewerName;
  final String reviewerAvatarUrl;
  final String comment;
  final int rating;
  final DateTime date;

  ReviewModel({
    required this.reviewerName,
    required this.reviewerAvatarUrl,
    required this.comment,
    required this.rating,
    required this.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewerName: json['reviewerName'] ?? '',
      reviewerAvatarUrl: json['reviewerAvatarUrl'] ?? '',
      comment: json['comment'] ?? '',
      rating: json['rating']?.toInt() ?? 0,
      date: DateTime.parse(json['date']),
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      reviewerName: reviewerName,
      reviewerAvatarUrl: reviewerAvatarUrl,
      comment: comment,
      rating: rating,
      date: date,
    );
  }

  toJson() {
    return {
      'reviewerName': reviewerName,
      'reviewerAvatarUrl': reviewerAvatarUrl,
      'comment': comment,
      'rating': rating,
      'date': date.toIso8601String(),
    };
  }
}