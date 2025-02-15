import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final bool secure;
  final TextEditingController controller;
  const TextFieldCustom({super.key,required this.hintText,required this.secure , required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: secure,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
           borderSide: BorderSide(color:Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:BorderSide(color:Theme.of(context).colorScheme.primary),
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color:Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
