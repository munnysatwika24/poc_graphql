import 'package:flutter/material.dart';

snackBar(String msg, BuildContext context) {
  if (msg.isNotEmpty) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}