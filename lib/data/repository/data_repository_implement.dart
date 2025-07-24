import 'package:base_project/data/service/remote_service.dart';
import 'package:base_project/model/post_model.dart';
import 'package:base_project/utils/Result.dart';

import '../service/shared_preferences_service.dart';
import 'data_repository.dart';

class DataRepositoryImplement extends DataRepository {
  final RemoteService remote;
  final SharedPreferencesService sharedPreferences;
  DataRepositoryImplement({required this.remote, required this.sharedPreferences});

  @override
  Future<Result<List<PostModel>>> getListPosts() {
    return remote.getListPosts();
  }

  @override
  Future<Result<bool>> isAuthenticated() {
    return sharedPreferences.getAuthenticated();
  }

  @override
  Future<Result<void>> setAuthenticated(bool isAuthenticate) async{
    return sharedPreferences.setAuthenticated(isAuthenticate);
  }

}