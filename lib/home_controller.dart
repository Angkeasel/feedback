import 'package:feedback/model/feedback_model.dart';
import 'package:feedback/model/google_sheets_api.dart';
import 'package:feedback/widgets/custom_emoji.dart';
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

  final loading = false.obs;
  //final value = false.obs;
  //final lable = ''.obs;
  List addCheckList = <bool>[].obs;
  final formatterDate = DateFormat.yMEd().add_jms().format(DateTime.now()).obs;

  List<CustomEmoji> emojiList = [
    const CustomEmoji(
        image: 'assets/png/Emoji_Icon_-_Smiling_large (1).webp',
        text: 'Excellent'
        //'Excellent',
        ),
    const CustomEmoji(
      image: 'assets/png/Smiling_Emoji_Icon_-_Blushed_large.webp',
      text: 'Good',
    ),
    const CustomEmoji(
      image:
          'assets/png/Neutral_Emoji_icon_9f1cc93a-f984-4b6c-896e-d24a643e4c28_grande.webp',
      text: 'Could be better',
    ),
    const CustomEmoji(
      image: 'assets/png/image_processing20200510-10309-w6xufo.png',
      text: 'Need Improvement',
    ),
  ];
  List<CustomEmoji> emojiListKM = [
    const CustomEmoji(
        image: 'assets/png/Emoji_Icon_-_Smiling_large (1).webp',
        text: 'ពេញចិត្តខ្លាំង'
        //'Excellent',
        ),
    const CustomEmoji(
      image: 'assets/png/Smiling_Emoji_Icon_-_Blushed_large.webp',
      text: 'ពេញចិត្ត',
    ),
    const CustomEmoji(
      image:
          'assets/png/Neutral_Emoji_icon_9f1cc93a-f984-4b6c-896e-d24a643e4c28_grande.webp',
      text: 'គួរកែតម្រូវ',
    ),
    const CustomEmoji(
      image: 'assets/png/image_processing20200510-10309-w6xufo.png',
      text: 'មិនពេញចិត្ត',
    ),
  ];
  final selectedItems = <String>[].obs;
  List<String> checkBoxList = [
    'Quantity',
    'Quality',
    'Service',
    'Hygiene',
  ];
  List<String> checkBoxListKM = [
    'បរិមាណ',
    'គុណភាព',
    'សេវាកម្ម',
    'អនាម័យ',
  ];
  // static const _localizedValues = <String, Map<String, String>>{
  //   'en': {
  //     'quantity': 'Quantity',
  //     'quality': 'Quality',
  //     'service': 'Service',
  //     'hygiene': 'Hygiene',
  //   },
  //   'km': {
  //     'quantity': 'បរិមាណ',
  //     'quality': 'គុណភាព',
  //     'service': 'សេវាកម្ម',
  //     'hygiene': 'អនាម័យ',
  //   },
  // };
  //  static List<String> languages() => _localizedValues.keys.toList();

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

  // Future<List<List<String>>> fetchData() async {
  //   final credentials = await auth.obtainAccessCredentialsViaUserConsent(
  //       auth.ClientId('102873799589624446595'),
  //       ['https://www.googleapis.com/auth/spreadsheets.readonly'],
  //       http.Client(),
  //       (url) {});

  //   final client = http.Client();
  //   final sheetsApi = sheets.SheetsApi(client);
  //   const spreadsheetId = '1idgEzrMrE57mmlc8WaTfILdTdpMlRMuxvuJxfIFf6_8';
  //   const range = 'feedbacksheet!A1:B10';

  //   final response = await sheetsApi.spreadsheets.values.get(
  //     spreadsheetId,
  //     range,

  //   );

  //   client.close();

  //   final values = response.values;
  //   return values;
  // }
}
