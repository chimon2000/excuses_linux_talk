import 'package:excuses_linux_talk/shared/api/facades.dart';
import 'package:excuses_linux_talk/shared/api/models.dart';

import 'package:riverpod/riverpod.dart';

final excusesProvider = FutureProvider<List<Excuse>>((ref) async {
  final excusesFacade = ref.read(ExcuseFacade.provider);
  return await excusesFacade.fetchExcuses();
});
