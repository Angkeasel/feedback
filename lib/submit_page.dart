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
        hideLoading(context: context);
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const MyHomePage();
        }));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Battambang'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/png/thanks.png'))),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
