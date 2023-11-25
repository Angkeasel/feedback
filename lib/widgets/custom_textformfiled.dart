import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanges;
  final String? Function(String?)? validator;
  // final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? initialValue;
  final bool? isValidate;
  final bool? obscureText;

  const CustomTextFormFiled(
      {super.key,
      this.controller,
      this.title,
      this.hintText,
      this.onSaved,
      this.onChanges,
      this.validator,
      this.keyboardType,
      this.suffixIcon,
      this.initialValue,
      this.obscureText,
      this.isValidate = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: validator,
            obscureText: obscureText ?? false,
            initialValue: initialValue,
            keyboardType: keyboardType,
            onChanged: onChanges,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hintText,
              labelStyle: const TextStyle(color: Colors.black),
              enabled: true,
              filled: true,
              fillColor: const Color(0xffF1F1F1),
              enabledBorder: isValidate!
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red))
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Color(0xffF1F1F1), width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xffF58220), width: 1)),
            ),
            onSaved: onSaved,

            // validator:
            // (v) {
            //   return v != null && v.contains('@') ? 'Don not use @ char' : null;
            //},
          ),
        ],
      ),
    );
  }
}
