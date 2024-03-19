import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomEmoji extends StatelessWidget {
  final String? image;
  final String? text;
  final GestureTapCallback? onTap;
  final double? isPadding;
  const CustomEmoji(
      {super.key, this.image, this.text, this.onTap, this.isPadding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image ?? '',
              fit: BoxFit.cover,
              height: context.isPhone ? 100 : 150,
            ),
            SizedBox(
              height: context.isPhone ? 5 : 8,
            ),
            Text(
              text ?? '',
              maxLines: 3,
              style: TextStyle(
                  fontSize: context.isPhone ? 16 : 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Battambang'),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
