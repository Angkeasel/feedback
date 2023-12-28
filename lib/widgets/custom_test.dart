import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/constants/app_colors.dart';

onShowModelBottomSheet(
    {required BuildContext context, final Function()? onPress}) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          height: 370,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: onPress,
                    icon: const Icon(Icons.cancel_outlined),
                    color: AppColor.mainColor,
                    iconSize: 30,
                  ),
                ),
              ),
              SvgPicture.asset('assets/image/asset/Group 47.svg'),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Your Submitted Successfully',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      });
}
