import 'package:base_project/data/repository/data_repository_implement.dart';
import 'package:base_project/data/service/remote_service.dart';
import 'package:base_project/data/service/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'data/repository/data_repository.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
  FlavorConfig(
    name: "DEV",
    color: Colors.red,
    variables: {
      "counter": 100,
      "baseUrl": "https://www.example1.com",
    },
  );
  runApp(MultiProvider(providers: [
    Provider(create: (context) => RemoteService(),),
    Provider(create: (context) => SharedPreferencesService()),
    Provider(create: (context) => DataRepositoryImplement(remote: context.read(),
        sharedPreferences: context.read()) as DataRepository)
  ],
      child: MyApp()));
}

