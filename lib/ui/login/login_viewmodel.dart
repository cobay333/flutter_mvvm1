

import 'package:base_project/route/routers_destination.dart';
import 'package:base_project/utils/Utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/repository/data_repository.dart';
import '../../utils/Result.dart';

class LoginViewModel with ChangeNotifier {
  LoginViewModel({required this.dataRepository});

  final DataRepository dataRepository;

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(BuildContext context, String email, String password) async {
    if (email.isEmpty) {
      Utils.toastMessage("Email is required");
      return;
    }
    if (password.isEmpty) {
      Utils.toastMessage("Password is required");
      return;
    }
    setLoading(true);
    await Future.delayed(const Duration(seconds: 30), () async {
      final result = await dataRepository.setAuthenticated(true);
      switch (result) {
        case Success<void>():
          if (context.mounted) {
            context.go(RoutersDestination.home);
          }
          setLoading(false);
          break;
        case Failure<void>():
          setLoading(false);
          Utils.toastMessage("Login Failure");
          break;
      }
    },);
  }
}
