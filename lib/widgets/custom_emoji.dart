import 'package:flutter/material.dart';

class CustomEmoji extends StatelessWidget {
  final String? image;
  final String? text;
  final GestureTapCallback? onTap;
  const CustomEmoji({super.key, this.image, this.text, this.onTap});

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
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text ?? '',
              style: const TextStyle(fontSize: 20, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
