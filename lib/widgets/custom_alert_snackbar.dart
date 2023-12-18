import 'package:feedback/config/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

BuildContext? dialogContext;
showLoading({
  required BuildContext context,
}) async {
  showDialog(
    context: context,
    builder: (context) {
      dialogContext = context;
      return WillPopScope(
        onWillPop: () async => true,
        child: Center(
          child: CircularProgressIndicator(
            color: AppColor.mainColor,
          ),
        ),
      );
    },
  );
}

hideLoading({
  required BuildContext context,
}) {
  Get.back();
}

void showLoadings() {
  showDialog(
    context: Get.overlayContext!,
    builder: (_) => WillPopScope(
      onWillPop: () async => true,
      child: const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: AppColor.mainColor,
        ),
      ),
    ),
  );
}

void removeLoading() {
  Navigator.of(Get.overlayContext!).pop();
}
