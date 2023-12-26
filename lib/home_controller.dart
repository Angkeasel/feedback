import 'package:feedback/model/checkbox_model.dart';
import 'package:feedback/model/emoji_model.dart';
import 'package:feedback/model/feedback_model.dart';
import 'package:feedback/model/google_sheets_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// import 'package:googleapis/sheets/v4.dart' as sheets;
// import 'package:googleapis_auth/auth_io.dart' as auth;
// import 'package:intl/intl.dart';
//import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final currentIndex = ''.obs;
  final feedback = FeedbackModel().obs;
  final newFeedback = FeedbackModel().obs;
  final feedbackList = <FeedbackModel>[].obs;
  final feedbackT = ''.obs;
  final isLoadingsub = false.obs;

  final loading = false.obs;
  //final value = false.obs;
  //final lable = ''.obs;
  List addCheckList = <bool>[].obs;
  final formatterDate = DateFormat.yMEd().add_jms().format(DateTime.now()).obs;

  List<EmojiModel> emojiList = [
    EmojiModel(
        emoji: 'assets/png/excellent.png',
        textKh: 'ពេញចិត្តខ្លាំង',
        textEn: 'Excellent'),
    EmojiModel(
        emoji: 'assets/png/good.png', textKh: 'ពេញចិត្ត', textEn: 'Good'),
    EmojiModel(
        emoji: 'assets/png/couldbetter.png',
        textKh: 'គួរកែតម្រូវ',
        textEn: 'Could be better'),
    EmojiModel(
        emoji: 'assets/png/inprovement.png',
        textKh: 'មិនពេញចិត្ត',
        textEn: 'Need Improvement'),
  ];
  final selectedItems = <String>[].obs;
  List<CheckBoxModel> checkBoxList = [
    CheckBoxModel(titleEn: 'Quantity', titleKh: 'បរិមាណ'),
    CheckBoxModel(titleEn: 'Quality', titleKh: 'គុណភាព'),
    CheckBoxModel(titleEn: 'Service', titleKh: 'សេវាកម្ម'),
    CheckBoxModel(titleEn: 'Hygiene', titleKh: 'អនាម័យ'),
  ];

  Future<void> insertFeedback(FeedbackModel newModel) async {
    loading(true);
    try {
      feedbackList.clear();
      debugPrint('========> find new model feedback ${newFeedback.value.id}');
      feedbackList.add(newModel);
      debugPrint('=======> Print List of Users $feedbackList');
      final jsonUsers = feedbackList.map((e) => e.toJson()).toList();
      debugPrint('=========> Print Json of User Model $jsonUsers');
      await FeedbackSheetAPI.insert(jsonUsers);
      loading(false);
    } catch (e) {
      loading(false);
      debugPrint('========> error$e');
    }
  }

/////////////////////////
}
