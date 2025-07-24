import 'package:base_project/data/repository/data_repository_implement.dart';
import 'package:base_project/data/service/remote_service.dart';
import 'package:base_project/data/service/shared_preferences_service.dart';
import 'package:base_project/route/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/repository/data_repository.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider(create: (context) => RemoteService(),),
    Provider(create: (context) => SharedPreferencesService()),
    Provider(create: (context) => DataRepositoryImplement(remote: context.read(),
        sharedPreferences: context.read()) as DataRepository)
  ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: route(),
    );
  }
}

