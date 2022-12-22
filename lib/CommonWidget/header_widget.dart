import 'package:flutter/material.dart';

class GenLoginSignUpHeader extends StatelessWidget {
  final String headerName;

  const GenLoginSignUpHeader(this.headerName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50.0),
        Text(
          headerName,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30.0),
        ),
        const SizedBox(height: 50.0),
      ],
    );
  }
}
