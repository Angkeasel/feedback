import 'package:feedback/config/constants/app_colors.dart';
import 'package:feedback/home_controller.dart';
import 'package:feedback/language_controller.dart';
import 'package:feedback/model/emoji_model.dart';
import 'package:feedback/model/feedback_model.dart';
import 'package:feedback/widgets/custom_alert_snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'generated/l10n.dart';

class SubQuestionPage extends StatefulWidget {
  final EmojiModel emojiModel;
  const SubQuestionPage({
    super.key,
    required this.emojiModel,
  });

  @override
  State<SubQuestionPage> createState() => _SubQuestionPageState();
}

class _SubQuestionPageState extends State<SubQuestionPage> {
  final homeCon = Get.put(HomeController());
  final lController = Get.find<LanguageController>();

  @override
  void initState() {
    homeCon.chearCheckBox();
    super.initState();
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        homeCon.chearCheckBox();
      });
      debugPrint('testing refreshing page ');
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Image.asset('assets/png/Group 48.png')),
              ),
              Text(
                '${L.current.chooseFeedbacksBelowThatYouThinkIs} ${lController.isKhmer ? widget.emojiModel.textKh : widget.emojiModel.textEn}?',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Battambang',
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    height: 1.5),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 3,
                child: ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeCon.checkBoxList.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.platform,
                      contentPadding: lController.isKhmer
                          ? EdgeInsets.only(
                              left: orientation == Orientation.portrait
                                  ? 80
                                  : 250,
                              right: orientation == Orientation.portrait
                                  ? 80
                                  : 230)
                          : EdgeInsets.only(
                              left: orientation == Orientation.portrait
                                  ? 50
                                  : 150,
                              right: orientation == Orientation.portrait
                                  ? 50
                                  : 150),
                      title: Text(
                        lController.isKhmer
                            ? homeCon.checkBoxList[index].titleKh
                            : homeCon.checkBoxList[index].titleEn,
                        style: const TextStyle(
                          fontFamily: 'Battambang',
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      activeColor: AppColor.mainColor,
                      value: homeCon.checkBoxList[index].selected,
                      onChanged: (value) {
                        setState(() {
                          homeCon.checkBoxList[index].selected = value ?? false;
                        });
                      },
                    );
                  },
                ),
              ),
              // Expanded(
              //   flex: orientation == Orientation.portrait ? 3 : 1,
              //   child: const SizedBox(),
              // )
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          final feedback =
              homeCon.checkBoxList.where((element) => element.selected);
          if (homeCon.checkBoxList
              .where((element) => element.selected)
              .isNotEmpty) {
            showLoading(context: context);
            final submitData = FeedbackModel(
              feedback: widget.emojiModel.textEn,
              reason: feedback.map((e) => e.titleEn).toList().join(','),
            );
            await homeCon.submit(submitData, context);
          }
        },
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: homeCon.checkBoxList
                        .where((element) => element.selected)
                        .isEmpty
                    ? Colors.grey.shade400
                    : AppColor.mainColor),
            child: Text(
              //check again
              L.current.submit,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Battambang',
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
