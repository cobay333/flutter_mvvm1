import 'package:dio/dio.dart';

import '../../model/post_model.dart';
import '../../utils/Result.dart';

class RemoteService {
  final dio = Dio();
  RemoteService() {
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          print('REQUEST[${options.method}] => PATH: ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print('ERROR[${e.response?.statusCode}] => MESSAGE: ${e.message}');
          return handler.next(e);
        }
    ));
  }

  Future<Result<List<PostModel>>> getListPosts() async {
    try {
      // dio.options.headers['Authorization'] = 'Bearer your_token';
      final response = await dio.get("https://jsonplaceholder.typicode.com/posts");
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        final List<PostModel> posts = jsonList.map((json) => PostModel.fromJson(json)).toList();
        return Result.success(posts);
      } else {
        return Result.failure(Exception(response.statusMessage));
      }
    } on DioException catch (e) {
      return Result.failure(e);
    }
  }
}