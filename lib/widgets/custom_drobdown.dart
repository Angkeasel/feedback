import 'package:flutter/material.dart';

class CustomDrobdown extends StatelessWidget {
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;
  final String? title;
  final String? value;
  const CustomDrobdown({
    super.key,
    this.items,
    this.onChanged,
    this.title,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            title ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10).copyWith(top: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white),
          child: DropdownButton<String>(
              underline: const Text(''),
              isExpanded: true,
              // Initial Value
              value: value,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              // Array list of items
              items: items,
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: onChanged),
        ),
      ],
    );
  }
}
