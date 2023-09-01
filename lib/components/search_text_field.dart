import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Icon? icon;
  final Function(String value) onSubmitted;
  const SearchTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.onSubmitted, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          prefixIcon: icon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 209, 209, 209))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 181, 181, 181))),
          fillColor: Colors.grey[200],
          filled: true,
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF232323))),
    );
  }
}
