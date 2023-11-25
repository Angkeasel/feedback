import 'package:feedback/model/feedback_fields.dart';

class FeedbackModel {
  final int? id;
  final String? feedback;
  final String? date;
  final String? reason;
  FeedbackModel({this.date, this.feedback, this.id, this.reason});

  Map<String, dynamic> toJson() => {
        FeedbackFields.id: id,
        FeedbackFields.feedback: feedback,
        FeedbackFields.date: date,
        FeedbackFields.reason: reason
      };
}
