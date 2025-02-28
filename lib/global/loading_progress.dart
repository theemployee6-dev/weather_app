import 'package:flutter/material.dart';

class LoadingProgress extends StatelessWidget {
  const LoadingProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator(color: Colors.redAccent),
        ),
      ),
    );
  }
}
