import 'package:feedback/config/constants/app_colors.dart';
import 'package:feedback/home_controller.dart';
import 'package:feedback/language_controller.dart';
import 'package:feedback/model/feedback_model.dart';
import 'package:feedback/model/google_sheets_api.dart';
import 'package:feedback/submit_page.dart';
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

  @override
  void initState() {
    debugPrint(
        '==========> model is working ${widget.feedbackModel!.feedback}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var testing = homeCon.selectedItems.join(',');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              // homeCon.selectedItems.clear();
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
              flex: 1,
              child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset('assets/png/Group 48.png')),
            ),
            Center(
                child: Text(
              "${L.current.chooseFeedbacksBelowThatYouThinkIs}${widget.feedbackModel!.feedback}?",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: lController.isKhmer
                    ? homeCon.checkBoxListKM.length
                    : homeCon.checkBoxList.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(
                      lController.isKhmer
                          ? homeCon.checkBoxListKM[index]
                          : homeCon.checkBoxList[index],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    activeColor: AppColor.mainColor,
                    value: homeCon.selectedItems.contains(lController.isKhmer
                        ? homeCon.checkBoxListKM[index]
                        : homeCon.checkBoxList[index]),
                    onChanged: (value) {
                      setState(() {
                        if (value != null && value) {
                          homeCon.selectedItems.add(lController.isKhmer
                              ? homeCon.checkBoxListKM[index]
                              : homeCon.checkBoxList[index]);
                        } else {
                          homeCon.selectedItems.remove(lController.isKhmer
                              ? homeCon.checkBoxListKM[index]
                              : homeCon.checkBoxList[index]);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: testing == ''
                  ? () {}
                  : () async {
                      int id = await FeedbackSheetAPI.getRowCount() + 1;
                      homeCon.newFeedback.value = FeedbackModel(
                          id: id,
                          date: widget.feedbackModel!.date,
                          feedback: widget.feedbackModel!.feedback,
                          reason: homeCon.selectedItems.join(','));

                      debugPrint(
                          '=========> check list reason ${homeCon.newFeedback.value.reason}');

                      homeCon.insertFeedback();
                      // wait for 3 seconds
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SubmitPage();
                      }));
                      // Future.delayed(const Duration(seconds: 3)).then((value) {
                      //   // Navigator.push(context,
                      //   //     MaterialPageRoute(builder: (context) {
                      //   //   return const SubmitPage();
                      //   // }));
                      // });
                    },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: testing == ''
                        ? Colors.grey.shade400
                        : AppColor.mainColor),
                child: Text(
                  L.current.submit,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
