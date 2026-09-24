import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text, this.color, this.colorTex});
  final VoidCallback onPressed ;
  final String text ;
  final double borderRadius = 10.0 ;
  final Color? color ;
  final Color? colorTex ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text , style: TextStyle(
            color: colorTex,
            fontWeight: FontWeight.bold,
            fontSize: 18 ,
          ),)
      ),
    );
  }
}
