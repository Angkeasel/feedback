// import 'package:feedback/home.dart';
// import 'package:feedback/widgets/custom_textformfiled.dart';
// import 'package:flutter/material.dart';

// class First extends StatefulWidget {
//   const First({super.key});

//   @override
//   State<First> createState() => _FirstState();
// }

// class _FirstState extends State<First> {
//  final GlobalKey  _formKey = GlobalKey();
//  final _feedbackController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomTextFormFiled(
//               controller:_feedbackController ,
//               title:' Question',
//               onChanges: (v){
//                 setState(() {
                  
//                 });
//               },
//              ),
//                const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context){
//                     return  const MyHomePage();
//                   }));
//                 },
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//     );
  
//   }
// }