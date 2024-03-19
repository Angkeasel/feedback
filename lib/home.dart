import 'package:feedback/config/constants/app_colors.dart';
import 'package:feedback/home_controller.dart';
import 'package:feedback/language_controller.dart';
import 'package:feedback/model/emoji_model.dart';
import 'package:feedback/sub_question.dart';
import 'package:feedback/widgets/custom_emoji.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'generated/l10n.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final homeCon = Get.put(HomeController());
  final lController = Get.find<LanguageController>();
  String greeting = '';

  void _pushToSubQuestionPage(EmojiModel emojiModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SubQuestionPage(
            emojiModel: emojiModel,
          );
        },
      ),
    );
  }

  // @override
  // void initState() {
  //   setState(() {
  //     checkTime();
  //   });
  //   super.initState();
  // }

  // String checkTime() {
  //   var now = DateTime.now();
  //   int hours = now.hour;
  //   if (hours >= 1 && hours <= 12) {
  //     greeting = 'Good Morning 🌞';
  //   } else if (hours >= 12 && hours <= 16) {
  //     greeting = 'Good Afternoon ⛅️';
  //   } else if (hours >= 16 && hours <= 21) {
  //     greeting = 'Good Evening 🌚';
  //   } else if (hours >= 21 && hours <= 24) {
  //     greeting = 'Good Night 😴';
  //   }
  //   return greeting;
  // }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 50),
              //     child: Text(
              //       greeting,
              //       style: TextStyle(
              //           fontFamily: 'Battambang',
              //           fontWeight: FontWeight.w700,
              //           fontSize: lController.isKhmer ? 20 : 18),
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      lController.toggleLanguage();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: AppColor.mainColor, width: 1)),
                      child: Center(
                        child: Text(
                          lController.isKhmer ? 'English' : 'ភាសាខ្មែរ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Battambang',
                              fontWeight: FontWeight.w700,
                              fontSize: lController.isKhmer ? 18 : 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.white,
                    child: Image.asset('assets/png/Group 48.png')),
              ),
              Container(
                padding: lController.isKhmer
                    ? const EdgeInsets.only(left: 10, right: 15)
                    : const EdgeInsets.only(top: 5, bottom: 5),
                //color: Colors.amber,
                child: Text(
                  L.current.shareYourExperienceWithCoffeeRestaurant,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Battambang',
                  ),
                ),
              ),
              orientation == Orientation.portrait
                  ? Expanded(
                      flex: context.isPhone ? 4 : 5,
                      child: SingleChildScrollView(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            gradient: RadialGradient(
                              colors: [
                                Colors.black,
                                Colors.white,
                              ],
                            ),
                          ),
                          child: GridView.builder(
                            itemBuilder: (_, index) {
                              final emojiModel = homeCon.emojiList[index];
                              return CustomEmoji(
                                image: emojiModel.emoji,
                                text: lController.isKhmer
                                    ? emojiModel.textKh
                                    : emojiModel.textEn,
                                isPadding: 15,
                                onTap: () async {
                                  _pushToSubQuestionPage(emojiModel);
                                },
                              );
                            },
                            itemCount: homeCon.emojiList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1,
                              childAspectRatio:
                                  context.isPhone && lController.isKhmer
                                      ? 6 / 5.5
                                      : context.isPhone && !lController.isKhmer
                                          ? 6 / 5
                                          : 1.0,
                            ),
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
                              ? homeCon.emojiList.asMap().entries.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 40),
                                    child: CustomEmoji(
                                      image: e.value.emoji,
                                      text: e.value.textKh,
                                      isPadding: 10,
                                      onTap: () {
                                        _pushToSubQuestionPage(e.value);
                                      },
                                    ),
                                  );
                                }).toList()
                              : homeCon.emojiList.asMap().entries.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 40),
                                    child: CustomEmoji(
                                      image: e.value.emoji,
                                      text: e.value.textEn,
                                      isPadding: 18,
                                      onTap: () {
                                        _pushToSubQuestionPage(e.value);
                                      },
                                    ),
                                  );
                                }).toList(),
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  L.current.qoute,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Battambang',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColor.mainColor),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '@copyright by KOFI ',
                    style: TextStyle(
                        fontFamily: 'Battambang',
                        fontWeight: FontWeight.w800,
                        fontSize: 12),
                  ),
                  Text(
                    'and developed by IT&HR team',
                    style: TextStyle(
                        fontFamily: 'Battambang',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
