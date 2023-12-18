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
        width: context.width / 6,
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
              height: 150,
            ),
            SizedBox(
              height: isPadding,
            ),
            Text(
              text ?? '',
              maxLines: 3,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
