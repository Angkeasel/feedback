// ignore_for_file: use_build_context_synchronously

import 'package:feedback/config/constants/app_colors.dart';
import 'package:feedback/home_controller.dart';
import 'package:feedback/language_controller.dart';
import 'package:feedback/model/feedback_model.dart';
import 'package:feedback/model/google_sheets_api.dart';
import 'package:feedback/submit_page.dart';
import 'package:feedback/widgets/custom_alert_snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'generated/l10n.dart';

class SubQuestionPage extends StatefulWidget {
  final FeedbackModel? feedbackModel;
  const SubQuestionPage({super.key, this.feedbackModel});

  @override
  State<SubQuestionPage> createState() => _SubQuestionPageState();
}

class _SubQuestionPageState extends State<SubQuestionPage> {
  final homeCon = Get.put(HomeController());
  final lController = Get.find<LanguageController>();
  bool isLoading = false;

  @override
  void initState() {
    homeCon.selectedItems.clear();
    changeFeedback();

    debugPrint(
        '==========> model is working ${widget.feedbackModel!.feedback}');

    super.initState();
  }

  String changeFeedback() {
    if (widget.feedbackModel!.feedback!.contains('ពេញចិត្តខ្លាំង') ||
        widget.feedbackModel!.feedback!.contains('Excellent')) {
      return homeCon.feedbackT.value = 'Excellent';
    } else if (widget.feedbackModel!.feedback!.contains('ពេញចិត្ត') ||
        widget.feedbackModel!.feedback!.contains('Good')) {
      return homeCon.feedbackT.value = 'Good';
    } else if (widget.feedbackModel!.feedback!.contains('គួរកែតម្រូវ') ||
        widget.feedbackModel!.feedback!.contains('Could be better')) {
      return homeCon.feedbackT.value = 'Could be better';
    } else {
      return homeCon.feedbackT.value = 'Need Improvement';
    }
  }

  @override
  Widget build(BuildContext context) {
    var testing = homeCon.selectedItems.join(',');
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/png/Group 48.png')),
            ),
            Text(
              "${L.current.chooseFeedbacksBelowThatYouThinkIs} ${widget.feedbackModel!.feedback}?",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 27, fontWeight: FontWeight.w700, height: 1.5),
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
                            left:
                                orientation == Orientation.portrait ? 80 : 250,
                            right:
                                orientation == Orientation.portrait ? 80 : 230)
                        : EdgeInsets.only(
                            left:
                                orientation == Orientation.portrait ? 50 : 150,
                            right:
                                orientation == Orientation.portrait ? 50 : 150),
                    title: Text(
                      lController.isKhmer
                          ? homeCon.checkBoxList[index].titleKh!
                          : homeCon.checkBoxList[index].titleEn!,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    activeColor: AppColor.mainColor,
                    value: homeCon.selectedItems
                        .contains(homeCon.checkBoxList[index].titleEn),
                    onChanged: (value) {
                      setState(() {
                        if (value != null && value) {
                          homeCon.selectedItems
                              .add(homeCon.checkBoxList[index].titleEn!);
                        } else {
                          homeCon.selectedItems
                              .remove(homeCon.checkBoxList[index].titleEn);
                        }
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
      bottomNavigationBar: GestureDetector(
        onTap: testing == ''
            ? () {}
            : () async {
                int id = await FeedbackSheetAPI.getRowCount() + 1;
                homeCon.newFeedback.value = FeedbackModel(
                    id: id,
                    date: widget.feedbackModel!.date,
                    feedback: homeCon.feedbackT.value,
                    reason: homeCon.selectedItems.join(','));
                debugPrint(
                    '=========> check list reason ${homeCon.newFeedback.value.reason}');
                homeCon.insertFeedback();
                showLoading(context: context);
                await Future.delayed(const Duration(seconds: 3), () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SubmitPage();
                  }));
                  hideLoading(context: context);
                });
              },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            padding: lController.isKhmer
                ? EdgeInsets.all(10)
                : const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    testing == '' ? Colors.grey.shade400 : AppColor.mainColor),
            child: Text(
              L.current.submit,
              textAlign: TextAlign.center,
              style: const TextStyle(
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
