import 'package:flutter/material.dart';

class LocationFailureWidget extends StatelessWidget {
  const LocationFailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Falha na Localização do GPS.',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
