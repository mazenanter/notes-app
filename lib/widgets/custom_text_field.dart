import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText,this.maxLines=1, this.onChanged, required this.controller});
final String hintText;
final int maxLines;
final TextEditingController controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: (value)
      {
        if(value!.isEmpty)
        {
          return 'Field Is Required';
        }else
        {
          return null;
        }
      },
      maxLines:maxLines ,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kPrimaryColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16,),
          borderSide: const BorderSide(color: Colors.white,),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16,),
          borderSide: const BorderSide(color: kPrimaryColor,),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16,),
          borderSide: const BorderSide(color: kPrimaryColor,),
        ),
      ),
    );
  }
}