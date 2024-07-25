import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.icon, this.onPressed});
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          text,
          style: const TextStyle(
            fontSize: 26,
          ),
        ),
        const Spacer(),
        Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15)),
            width: 50,
            child: IconButton(
              onPressed:onPressed,
              icon:  Icon(icon),
            )),
      ],
    );
  }
}
