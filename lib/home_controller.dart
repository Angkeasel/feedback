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

  final loading = false.obs;
  //final value = false.obs;
  //final lable = ''.obs;
  List addCheckList = <bool>[].obs;
  final formatterDate = DateFormat.yMEd().add_jms().format(DateTime.now()).obs;

  List<EmojiModel> emojiList = [
    EmojiModel(
        emoji: 'assets/png/Emoji_Icon_-_Smiling_large (1).webp',
        textKh: 'ពេញចិត្តខ្លាំង',
        textEn: 'Excellent'),
    EmojiModel(
        emoji: 'assets/png/Smiling_Emoji_Icon_-_Blushed_large.webp',
        textKh: 'ពេញចិត្ត',
        textEn: 'Good'),
    EmojiModel(
        emoji:
            'assets/png/Neutral_Emoji_icon_9f1cc93a-f984-4b6c-896e-d24a643e4c28_grande.webp',
        textKh: 'គួរកែតម្រូវ',
        textEn: 'Could be better'),
    EmojiModel(
        emoji: 'assets/png/image_processing20200510-10309-w6xufo.png',
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

  Future insertFeedback() async {
    loading(true);
    try {
      feedbackList.clear();
      debugPrint('========> find new model feedback ${newFeedback.value.id}');
      feedbackList.add(newFeedback.value);
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
