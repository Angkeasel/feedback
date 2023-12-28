// ignore_for_file: constant_identifier_names

import 'package:feedback/model/checkbox_model.dart';
import 'package:feedback/model/emoji_model.dart';
import 'package:feedback/model/feedback_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const String _URL =
    'https://script.google.com/macros/s/AKfycbw16_IlrCQDwXqkenqiCXcbw4ekWMQl5d14s1L_eidKGlRFnTLH8rbjLoiuIUW0YF-H/exec';

class HomeController extends GetxController {
  List<EmojiModel> get emojiList => [
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

  List<CheckBoxModel> get _checkBoxList => [
        CheckBoxModel(titleEn: 'Quantity', titleKh: 'បរិមាណ'),
        CheckBoxModel(titleEn: 'Quality', titleKh: 'គុណភាព'),
        CheckBoxModel(titleEn: 'Service', titleKh: 'សេវាកម្ម'),
        CheckBoxModel(titleEn: 'Hygiene', titleKh: 'អនាម័យ'),
      ];

  List<CheckBoxModel> checkBoxList = [];

  @override
  void onInit() {
    chearCheckBox();
    super.onInit();
  }

  void chearCheckBox() {
    checkBoxList = _checkBoxList;
    update();
    refresh();
  }

  // submit form
  static const STATUS_SUCCESS = 'SUCCESS';

  Future<void> submit(FeedbackModel submitModel) async {
    try {
      final url = Uri.parse(_URL);

      await http
          .post(
        url,
        headers: {
          'Accept': 'application/json',
        },
        body: submitModel.toJson(),
      )
          .then((response) {
        debugPrint('Response ${response.statusCode} : ${response.body}');
      });
    } catch (e) {
      debugPrint('Error $e');
    } finally {
      chearCheckBox();
    }
  }
}
