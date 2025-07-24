import 'dart:ffi';

import 'package:base_project/utils/Result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<Result<bool>> getAuthenticated() async {
    try {
      final prefer = await SharedPreferences.getInstance();
      final isAuthenticated = prefer.getBool("isAuthenticated");
      return Result.success(isAuthenticated ?? false);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  Future<Result<void>> setAuthenticated(bool isAuthenticate) async {
    try {
      final prefer = await SharedPreferences.getInstance();
      prefer.setBool("isAuthenticated", isAuthenticate);
      return Result.success(null);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}