// ignore_for_file: use_build_context_synchronously

import 'package:feedback/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'generated/l10n.dart';
import 'home.dart';
import 'widgets/custom_alert_snackbar.dart';

class SubmitPage extends StatefulWidget {
  const SubmitPage({super.key});

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  final homeCon = Get.put(HomeController());
  bool isVisibleSub = false;
  BuildContext? contexts;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      showLoading(context: context);
      await Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const MyHomePage();
        }));
      });
      hideLoading(context: context);
      homeCon.selectedItems.value = [];
    });
    super.initState();
  }

  // void testing(BuildContext context) async {
  //   context.loaderOverlay.show(
  //       // progress: 'Doing progress #0',
  //       );
  //   setState(() {
  //     isVisibleSub = context.loaderOverlay.visible;
  //   });
  //   await Future.delayed(const Duration(seconds: 1), () {
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //       return const MyHomePage();
  //     }));
  //   });
  //   // await Future.delayed(const Duration(seconds: 1));
  //   // context.loaderOverlay.progress('Doing progress #1');
  //   // await Future.delayed(const Duration(seconds: 1));
  //   // context.loaderOverlay.progress('Doing progress #2');
  //   // await Future.delayed(const Duration(seconds: 1));
  //   // context.loaderOverlay.progress('Doing progress #3');
  //   // await Future.delayed(const Duration(seconds: 1));

  //   if (isVisibleSub) {
  //     context.loaderOverlay.hide();
  //   }
  //   // setState(() {
  //   //   isVisibleSub = context.loaderOverlay.visible;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Image.asset('assets/png/Group 48.png')),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              L.current.thankYouForYourFeedback,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/png/Png.png'))),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
