import 'package:flutter/material.dart';

class ErrorSnapshotWidget extends StatelessWidget {
  const ErrorSnapshotWidget({super.key, required this.titleError});
  final String titleError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Erro: $titleError'),
      ),
    );
  }
}
