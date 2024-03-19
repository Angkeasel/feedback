import 'package:feedback/model/feedback_fields.dart';

class FeedbackModel {
  final String feedback;
  final String reason;
  final String? location;

  FeedbackModel({required this.feedback, required this.reason, this.location});

  Map<String, dynamic> toJson() => {
        FeedbackFields.feedback: feedback,
        FeedbackFields.reason: reason,
        FeedbackFields.location: location
      };
}
