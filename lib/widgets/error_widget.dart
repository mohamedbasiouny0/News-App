import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key, required this.message});
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? 'There was an unexpected error',
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}
