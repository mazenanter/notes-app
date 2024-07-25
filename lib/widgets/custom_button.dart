import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading=false});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16,)
        ),
        child: Center(
          child:isLoading? CircularProgressIndicator(
            backgroundColor: Colors.black,
          ) : Text(
            'Add',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}