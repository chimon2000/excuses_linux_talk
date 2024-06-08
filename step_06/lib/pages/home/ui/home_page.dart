import 'dart:math';
import 'package:excuses_linux_talk/pages/home/state/providers.dart';
import 'package:excuses_linux_talk/shared/api/models.dart';
import 'package:excuses_linux_talk/shared/ui/excuse_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, ref) {
    final excuses$ = ref.watch(excusesProvider);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: excuses$.when(
                  data: (excuses) => ExcusesDataView(
                    id: ref.watch(selectedIdProvider) ?? id,
                    excuses: excuses,
                  ),
                  error: (_, __) => const ExcuseErrorView(),
                  loading: () => const ExcuseSkeletonView(),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: excuses$.hasValue
          ? NextFloatingActionButton(
              excuses: excuses$.value!,
              onPressed: (value) {
                ref.read(selectedIdProvider.notifier).state =
                    int.tryParse(value) ?? 1;
              },
            )
          : null,
    );
  }
}

class ExcusesDataView extends StatelessWidget {
  const ExcusesDataView({
    super.key,
    required this.excuses,
    required this.id,
  });

  final List<Excuse> excuses;
  final int id;

  @override
  Widget build(BuildContext context) {
    return ExcusePageView(
      excuses: excuses
          .map((e) => ExcuseViewData(
                id: e.id,
                text: e.text,
              ))
          .toList(),
      currentExcuse: id,
    );
  }
}

class ExcuseErrorView extends StatelessWidget {
  const ExcuseErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text('Something went wrong with your request'),
      ),
    );
  }
}

class ExcuseSkeletonView extends StatelessWidget {
  const ExcuseSkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60.0,
                  color: Colors.white,
                ),
                const Gap(2.0),
                Container(
                  height: 60.0,
                  color: Colors.white,
                ),
                const Gap(2.0),
                Container(
                  height: 60.0,
                  color: Colors.white,
                ),
                const Gap(2.0),
                Container(
                  height: 60.0,
                  color: Colors.white,
                ),
                const Gap(2.0),
                Container(
                  height: 60.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextFloatingActionButton extends StatelessWidget {
  const NextFloatingActionButton({
    super.key,
    required this.excuses,
    this.onPressed,
  });

  final List<Excuse> excuses;
  final ValueChanged<String>? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.arrow_forward),
      onPressed: () {
        final currentPage = _randomIndex(excuses.length);
        final id = excuses[currentPage].id.toString();

        onPressed?.call(id);
      },
    );
  }
}

int _randomIndex(int length) => Random().nextInt(length);
