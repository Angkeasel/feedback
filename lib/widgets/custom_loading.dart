// import 'dart:ui';

// import 'package:flutter/material.dart';

// import '../config/constants/app_colors.dart';

// class CustomLoading extends StatelessWidget {
//   final bool? isLoading;
//   const CustomLoading({super.key, this.isLoading = false});

//   @override
//   Widget build(BuildContext context) {
//     return isLoading!
//         ? Center(
//             child: CircularProgressIndicator(
//               color: AppColor.mainColor,
//               backgroundColor: Colors.grey.shade300,
//               value: 50,
//             ),
//           )
//         : Container();
//     // LoaderOverlay(
//     //     overlayColor: Colors.transparent,
//     //     useDefaultLoading: false,
//     //     overlayWidgetBuilder: (progress) {
//     //       debugPrint('======> progress $progress');
//     //       return Column(
//     //         children: [
//     //           BackdropFilter(
//     //               filter: ImageFilter.blur(
//     //             sigmaX: 4.5,
//     //             sigmaY: 4.5,
//     //           )),
//     //           if (progress != null) Text(progress)
//     //         ],
//     //       );
//     //     },
//     //     child: Container() );
//   }
// }
