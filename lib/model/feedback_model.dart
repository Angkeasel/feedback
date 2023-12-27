import 'package:feedback/model/feedback_fields.dart';

class FeedbackModel {
  final String? feedback;
  final String? date;
  final String? reason;
  FeedbackModel({this.date, this.feedback, this.reason});
  
  Map<String, dynamic> toJson() => {
        FeedbackFields.feedback: feedback,
        FeedbackFields.date: date,
        FeedbackFields.reason: reason
      };
}
