import 'package:feedback/model/feedback_fields.dart';

class FeedbackModel {
  final String feedback;
  final String reason;
  final String? location;

  final String? comments;

  FeedbackModel({
    required this.feedback,
    required this.reason,
    this.location,
    this.comments,
  });

  Map<String, dynamic> toJson() => {
        FeedbackFields.feedback: feedback,
        FeedbackFields.reason: reason,
        FeedbackFields.location: location,
        FeedbackFields.comments: comments,
      };
}
