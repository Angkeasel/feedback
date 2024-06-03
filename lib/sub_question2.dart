import 'package:feedback/home_controller.dart';
import 'package:feedback/model/feedback_model.dart';
import 'package:feedback/sub_question3.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/constants/app_colors.dart';
import 'generated/l10n.dart';

import 'widgets/custom_alert_snackbar.dart';
import 'widgets/custom_textformfiled.dart';

class SubScreen2 extends StatefulWidget {
  final FeedbackModel? feedbackModel;

  const SubScreen2({super.key, this.feedbackModel});

  @override
  State<SubScreen2> createState() => _SubScreen2State();
}

class _SubScreen2State extends State<SubScreen2> {
  @override
  void initState() {
    // homeCon.dropdownFoodValue.value = 'បរិមាណល្មម';
    // homeCon.dropdownvalue.value = 'បរិមាណល្មម';
    // homeCon.dropdownSweetValue.value = 'បរិមាណល្មម';
    homeCon.commentController.text = '';

    super.initState();
  }

  final homeCon = Get.put(HomeController());
  void _push3ToSubQuestionPage(FeedbackModel feedbackModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SubQuestion3(
            feedbackModel: feedbackModel,
          );
        },
      ),
    );
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        // homeCon.dropdownFoodValue.value = 'បរិមាណល្មម';
        // homeCon.dropdownvalue.value = 'បរិមាណល្មម';
        // homeCon.dropdownSweetValue.value = 'បរិមាណល្មម';
        homeCon.commentController.text = '';
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
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Image.asset('assets/png/Group 48.png')),
              ),
              const Text(
                'សូមធ្វើការបញ្ចេញមតិកែលម្អ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Battambang',
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    height: 1.5),
              ),
              Text(
                '**ប្រសិនបើលោកអ្នកមិនមានមតិយោបល់ខាងក្រោមទេ សូមចុចបន្ត**',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontFamily: 'Battambang',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.5),
              ),
              Expanded(
                flex: 9,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // CustomDrobdown(
                        //   value: homeCon.dropdownvalue.value,
                        //   title: 'សម្លរ',
                        //   items: homeCon.dropdownSoupList
                        //       .asMap()
                        //       .entries
                        //       .map((items) {
                        //     return DropdownMenuItem<String>(
                        //       onTap: () {
                        //         homeCon.dropdownvalueIndex.value = items.key;
                        //       },
                        //       value: items.value,
                        //       child: Text(items.value),
                        //     );
                        //   }).toList(),
                        //   onChanged: (String? newValue) {
                        //     setState(() {
                        //       homeCon.dropdownvalue.value = newValue!;
                        //     });
                        //     debugPrint(
                        //         '========>${homeCon.dropdownvalue.value}');
                        //   },
                        // ),
                        // CustomDrobdown(
                        //   value: homeCon.dropdownFoodValue.value,
                        //   title: 'ម្ហូបគោក',
                        //   items: homeCon.dropdownFoodList
                        //       .asMap()
                        //       .entries
                        //       .map((items) {
                        //     return DropdownMenuItem<String>(
                        //       onTap: () {
                        //         homeCon.dropdownvalueIndex.value = items.key;
                        //       },
                        //       value: items.value,
                        //       child: Text(items.value),
                        //     );
                        //   }).toList(),
                        //   onChanged: (String? newValue) {
                        //     setState(() {
                        //       homeCon.dropdownFoodValue.value = newValue!;
                        //     });
                        //     debugPrint(
                        //         '========>${homeCon.dropdownFoodValue.value}');
                        //   },
                        // ),
                        // CustomDrobdown(
                        //   value: homeCon.dropdownSweetValue.value,
                        //   title: 'បង្អែម',
                        //   items: homeCon.dropdownSweetList
                        //       .asMap()
                        //       .entries
                        //       .map((items) {
                        //     return DropdownMenuItem<String>(
                        //       onTap: () {
                        //         homeCon.dropdownSweetValueIndex.value =
                        //             items.key;
                        //       },
                        //       value: items.value,
                        //       child: Text(items.value),
                        //     );
                        //   }).toList(),
                        //   onChanged: (String? newValue) {
                        //     setState(() {
                        //       homeCon.dropdownSweetValue.value = newValue!;
                        //     });
                        //     debugPrint(
                        //         '========>${homeCon.dropdownSweetValue.value}');
                        //   },
                        // ),
                        Padding(
                          padding: EdgeInsets.all(
                                  orientation == Orientation.portrait ? 10 : 60)
                              .copyWith(top: 30),
                          child: CustomTextFormFiled(
                            controller: homeCon.commentController,
                            onChanges: (v) {},
                            title: 'Comments (មតិយោបល់)',
                            maxLines: 6,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          showLoading(context: context);
          final submitData = FeedbackModel(
              feedback: widget.feedbackModel!.feedback,
              reason: widget.feedbackModel!.reason,
              comments: homeCon.commentController.text);
          _push3ToSubQuestionPage(submitData);
        },
        child: Padding(
          padding:
              const EdgeInsets.only(left: 60, right: 60, bottom: 30, top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.mainColor
                // color: homeCon.selectedModel.locationEN!.isEmpty
                //     ? Colors.grey.shade400
                //     : AppColor.mainColor,
                ),
            child: Text(
              L.current.next,
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
