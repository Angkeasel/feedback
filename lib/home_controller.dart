// ignore_for_file: constant_identifier_names

import 'package:feedback/model/checkbox_model.dart';
import 'package:feedback/model/emoji_model.dart';
import 'package:feedback/model/feedback_model.dart';
import 'package:feedback/submit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'model/location_model.dart';
import 'widgets/custom_alert_snackbar.dart';

const String URL =
    'https://script.google.com/macros/s/AKfycbz6KqDG54riBUXracaE348TIuwK2cKuCLsldFMPeBuPzUzBAxg0IBNL7u0W0mSf6w8PwQ/exec'; // v2
// const String URL =
//     'https://script.google.com/macros/s/AKfycby6laJyydx133nCn11NDFkL_pKuXce5tMTnKgQ6teUNge63l97F3--sQmlgWjQTAmacAA/exec';

class HomeController extends GetxController {
  TextEditingController commentController = TextEditingController();

  final dropdownvalue = 'បរិមាណល្មម'.obs;
  final dropdownvalueIndex = 0.obs;
  List<String> dropdownSoupList = [
    'បរិមាណល្មម',
    'បរិមាណតិច',
    'បរិមាណច្រើនពេក',
    'សាប',
    'ប្រៃ',
    'ជូរ',
    'ផ្អែម',
    'ហឹរ',
    'ល្មមឆ្ងាញ់'
  ];
  final dropdownFoodValue = 'បរិមាណល្មម'.obs;
  final dropdownFoodValueIndex = 0.obs;
  List<String> dropdownFoodList = [
    'បរិមាណល្មម',
    'បរិមាណតិច',
    'បរិមាណច្រើនពេក',
    'សាប',
    'ប្រៃ',
    'ជូរ',
    'ផ្អែម',
    'ហឹរ',
    'ល្មមឆ្ងាញ់'
  ];
  final dropdownSweetValue = 'បរិមាណល្មម'.obs;
  final dropdownSweetValueIndex = 0.obs;
  List<String> dropdownSweetList = [
    'បរិមាណល្មម',
    'បរិមាណតិច',
    'បរិមាណច្រើនពេក',
    'ផ្អែមតិច',
    'ផ្អែមខ្លាំង',
    'ល្មមឆ្ងាញ់'
  ];
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

  List<LocationBoxModel> get _locationList => [
        LocationBoxModel(
            locationEN: 'ShowRoom', locationKH: 'ការិយាល័យផ្នែកលក់ (Showroom)'),
        LocationBoxModel(
            locationEN: 'Head Office',
            locationKH: 'ការិយាល័យកណ្ដាល (Head office)'),
      ];
  List<LocationBoxModel> locationList = [];
  LocationBoxModel selectedModel = LocationBoxModel();
  @override
  void onInit() {
    chearCheckBox();
    URL;
    super.onInit();
  }

  void chearCheckBox() {
    checkBoxList = _checkBoxList;
    locationList = _locationList;
    update();
    refresh();
  }

  final clearSoupValue = 'បរិមាណល្មម'.obs;
  final clearFoodValue = 'បរិមាណល្មម'.obs;
  final clearSweetValue = 'បរិមាណល្មម'.obs;
  // submit form
  static const STATUS_SUCCESS = 'SUCCESS';

  Future<void> submit(FeedbackModel submitModel, BuildContext context) async {
    try {
      final url = Uri.parse(URL);

      await http
          .post(
        url,
        headers: {
          'Accept': 'application/json',
        },
        body: submitModel.toJson(),
      )
          .then((response) {
        debugPrint('status code:${response.statusCode}');
        if (response.statusCode == 302 || response.statusCode == 200) {
          hideLoading(context: context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SubmitPage(),
            ),
          );
          debugPrint(response.body);
        } else {
          debugPrint('${response.statusCode} ${response.body}');
        }
      });
    } catch (e) {
      debugPrint('Error $e');
    } finally {
      chearCheckBox();
    }
  }
}
