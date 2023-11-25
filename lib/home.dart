import 'package:feedback/config/constants/app_colors.dart';
import 'package:feedback/home_controller.dart';
import 'package:feedback/language_controller.dart';
import 'package:feedback/model/feedback_model.dart';

import 'package:feedback/sub_question.dart';

import 'package:feedback/widgets/custom_emoji.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'generated/l10n.dart';
// import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final homeCon = Get.put(HomeController());
  final lController = Get.find<LanguageController>();

  //String? autoId;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      lController.toggleLanguage();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: AppColor.mainColor, width: 1)),
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Text(
                      lController.isKhmer ? "English" : "ភាសាខ្មែរ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Image.asset('assets/png/Group 48.png')),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        L.current.shareYourExperienceWithCoffeeRestaurant,
                        //  'What do you think about our service?',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                      // Text(
                      //   '(Share your experience with Coffee Restaurant)',
                      //   //  'What do you think about our service?',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //       fontSize: 25, fontWeight: FontWeight.w700),
                      // ),
                    ],
                  )),
              orientation == Orientation.portrait
                  ? Expanded(
                      flex: 5,
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: RadialGradient(
                                  colors: [Colors.black, Colors.white])),
                          child: GridView.builder(
                            itemBuilder: (_, int index) {
                              return CustomEmoji(
                                image: lController.isKhmer
                                    ? homeCon.emojiListKM[index].image
                                    : homeCon.emojiList[index].image,
                                text: lController.isKhmer
                                    ? homeCon.emojiListKM[index].text
                                    : homeCon.emojiList[index].text,
                                onTap: () {
                                  debugPrint('======> testing ');

                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SubQuestionPage(
                                        feedbackModel: FeedbackModel(
                                      date: DateFormat.yMEd()
                                          .add_jms()
                                          .format(DateTime.now()),
                                      feedback: lController.isKhmer
                                          ? homeCon.emojiListKM[index].text
                                          : homeCon.emojiList[index].text,
                                    ));
                                  }));
                                },
                                // onTap: () async {
                                //   homeCon.currentIndex.value =
                                //       homeCon.emojiList[index].text!;
                                //   debugPrint(
                                //       '==========> ${homeCon.currentIndex.value}');
                                //   final id = await FeedbackSheetAPI.getRowCount() + 1;
                                //   FeedbackModel(
                                //     id: id,
                                //     date: DateFormat.yMEd()
                                //         .add_jms()
                                //         .format(DateTime.now()),
                                //     feedback: homeCon.emojiList[index].text,
                                //   );
                                //   homeCon.insertFeedback();
                                //   homeCon.update();
                                //   Navigator.push(context,
                                //       MaterialPageRoute(builder: (context) {
                                //     return const SubmitPage();
                                // }));
                                //},
                              );
                            },
                            itemCount: lController.isKhmer
                                ? homeCon.emojiListKM.length
                                : homeCon.emojiList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      flex: 5,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: lController.isKhmer
                              ? homeCon.emojiListKM.asMap().entries.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: CustomEmoji(
                                      image: e.value.image,
                                      text: e.value.text,
                                      onTap: () {
                                        debugPrint('======> testing ');

                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SubQuestionPage(
                                              feedbackModel: FeedbackModel(
                                            date: DateFormat.yMEd()
                                                .add_jms()
                                                .format(DateTime.now()),
                                            feedback: e.value.text,
                                          ));
                                        }));
                                      },
                                    ),
                                  );
                                }).toList()
                              : homeCon.emojiList.asMap().entries.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: CustomEmoji(
                                      image: e.value.image,
                                      text: e.value.text,
                                      onTap: () {
                                        debugPrint('======> testing ');

                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SubQuestionPage(
                                              feedbackModel: FeedbackModel(
                                            date: DateFormat.yMEd()
                                                .add_jms()
                                                .format(DateTime.now()),
                                            feedback: e.value.text,
                                          ));
                                        }));
                                      },
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                    ),
            ],
          ),
        ));
  }
}