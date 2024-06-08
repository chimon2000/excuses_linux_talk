import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:excuses_linux_talk/shared/api/models.dart';
import 'package:riverpod/riverpod.dart';

class ExcuseFacade {
  Future<List<Excuse>> fetchExcuses() async {
    try {
      Response response = await Dio().get(
          'https://s3.ap-south-1.amazonaws.com/idontlikework/wfh-reasons.json');

      List<dynamic> json = jsonDecode(response.data);
      var excuses = json.map((json) => Excuse.fromJson(json)).toList();

      return excuses;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// TODO: Not actually implemented.
  Future<bool> toggleFavorite(int id) async {
    return true;
  }

  static final provider = Provider<ExcuseFacade>((ref) {
    return ExcuseFacade();
  });
}
