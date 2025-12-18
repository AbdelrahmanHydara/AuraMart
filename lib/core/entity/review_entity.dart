class ReviewEntity {
  final String reviewerName;
  final String reviewerAvatarUrl;
  final String comment;
  final int rating;
  final DateTime date;

  ReviewEntity({
    required this.reviewerName,
    required this.reviewerAvatarUrl,
    required this.comment,
    required this.rating,
    required this.date,
  });
}