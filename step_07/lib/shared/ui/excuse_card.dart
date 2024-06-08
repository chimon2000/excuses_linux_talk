import 'package:flutter/material.dart';

class ExcuseCard extends StatelessWidget {
  const ExcuseCard({super.key, required this.excuse});

  final String excuse;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Center(
      child: Text(
        excuse,
        style: textTheme.headlineMedium,
      ),
    );
  }
}
