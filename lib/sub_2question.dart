import 'package:feedback/home_controller.dart';

import 'package:feedback/model/feedback_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/constants/app_colors.dart';

import 'generated/l10n.dart';
import 'language_controller.dart';
import 'model/location_model.dart';
import 'widgets/custom_alert_snackbar.dart';

class Sub2Question extends StatefulWidget {
  final FeedbackModel? feedbackModel;
  const Sub2Question({super.key, this.feedbackModel});

  @override
  State<Sub2Question> createState() => _Sub2QuestionState();
}

class _Sub2QuestionState extends State<Sub2Question> {
  final homeCon = Get.put(HomeController());
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
    final lController = Get.find<LanguageController>();
    final orientation = MediaQuery.of(context).orientation;
    final homeCon = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
                '${L.current.location} ',
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
                flex: 2,
                child: ListView.builder(
                  itemCount: homeCon.locationList.length,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      contentPadding: lController.isKhmer
                          ? EdgeInsets.only(
                              left: orientation == Orientation.portrait
                                  ? 60
                                  : 260,
                            )
                          : EdgeInsets.only(
                              left: orientation == Orientation.portrait
                                  ? 60
                                  : 180,
                            ),
                      activeColor: AppColor.mainColor,
                      title: Text(
                        lController.isKhmer
                            ? homeCon.locationList[index].locationKH!
                            : homeCon.locationList[index].locationEN!,
                        style: const TextStyle(
                          fontFamily: 'Battambang',
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      value: homeCon.locationList[index],
                      groupValue: homeCon.selectedModel,
                      onChanged: (value) {
                        // Update the selected model when a radio button is selected
                        setState(() {
                          homeCon.selectedModel = value as LocationBoxModel;
                        });
                        debugPrint('hello ${homeCon.selectedModel.locationEN}');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          if (homeCon.selectedModel.locationEN!.isNotEmpty) {
            showLoading(context: context);
            final submitData = FeedbackModel(
                feedback: widget.feedbackModel!.feedback,
                reason: widget.feedbackModel!.reason,
                location: homeCon.selectedModel.locationEN);
            await homeCon.submit(submitData, context);
          }
        },
        child: Padding(
          padding:
              const EdgeInsets.only(left: 60, right: 60, bottom: 30, top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: homeCon.selectedModel.locationEN!.isEmpty
                    ? Colors.grey.shade400
                    : AppColor.mainColor),
            child: Text(
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
