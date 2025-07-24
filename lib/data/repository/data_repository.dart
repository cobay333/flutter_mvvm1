import 'package:base_project/utils/Result.dart';

import '../../model/post_model.dart';

abstract class DataRepository {
  Future<Result<bool>> isAuthenticated();
  Future<Result<void>> setAuthenticated(bool isAuthenticate);
  Future<Result<List<PostModel>>> getListPosts();
}