import 'package:feedback/model/feedback_fields.dart';

class FeedbackModel {
  final String feedback;
  final String reason;

  FeedbackModel({
    required this.feedback,
    required this.reason,
  });

  Map<String, dynamic> toJson() => {
        FeedbackFields.feedback: feedback,
        FeedbackFields.reason: reason,
      };
}
