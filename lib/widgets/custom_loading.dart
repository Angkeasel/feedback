import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../config/constants/app_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
        overlayColor: Colors.transparent,
        useDefaultLoading: false,
        overlayWidgetBuilder: (progress) {
          debugPrint('======> progress $progress');
          return Column(
            children: [
              BackdropFilter(
                  filter: ImageFilter.blur(
                sigmaX: 4.5,
                sigmaY: 4.5,
              )),
              if (progress != null) Text(progress)
            ],
          );
        },
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColor.mainColor,
          ),
        ));
  }
}
