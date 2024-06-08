import 'package:animations/animations.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'excuse_card.dart';

class ExcusePageView extends StatelessWidget {
  final List<ExcuseViewData>? excuses;
  final int? currentExcuse;

  const ExcusePageView({super.key, this.excuses, this.currentExcuse});

  @override
  Widget build(BuildContext context) {
    var selectedExcuse =
        excuses!.firstWhere((element) => element.id == currentExcuse);

    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation, secondAnimation) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        );
      },
      child: ExcuseCard(
        key: ValueKey(selectedExcuse.id),
        excuse: selectedExcuse.text,
      ),
    );
  }
}

class ExcuseViewData extends Equatable {
  const ExcuseViewData({
    required this.id,
    required this.text,
  });

  final int id;
  final String text;

  @override
  List<Object> get props => [id, text];
}
