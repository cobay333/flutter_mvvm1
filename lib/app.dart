import 'package:base_project/data/repository/data_repository_implement.dart';
import 'package:base_project/data/service/remote_service.dart';
import 'package:base_project/data/service/shared_preferences_service.dart';
import 'package:base_project/route/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:provider/provider.dart';

import 'data/repository/data_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int _counter = FlavorConfig.instance.variables["counter"];
    print(_counter);
    return MaterialApp.router(
      routerConfig: route(),
    );
  }
}

