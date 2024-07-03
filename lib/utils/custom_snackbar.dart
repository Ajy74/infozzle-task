
import 'package:flutter/material.dart';

dynamic customSnackBar(BuildContext context,String text,Color color){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: color,
    ),
  );
}