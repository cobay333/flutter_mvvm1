import 'package:base_project/data/repository/data_repository.dart';
import 'package:base_project/model/post_model.dart';
import 'package:flutter/foundation.dart';

import '../../utils/Result.dart';

sealed class HomeScreenState {

}
class LoadingState extends HomeScreenState{}
class SuccessState extends HomeScreenState{
  final List<PostModel> data;
  SuccessState(this.data);
}
class FailureState extends HomeScreenState{
  final String message;
  FailureState(this.message);
}


class HomeViewModel with ChangeNotifier {
  final DataRepository dataRepository;

  HomeViewModel(this.dataRepository);

  HomeScreenState _state = LoadingState();
  HomeScreenState get state => _state;

  void setState(HomeScreenState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> fetchPosts() async {
    setState(LoadingState());
    try {
      final result = await dataRepository.getListPosts();
      switch (result) {
        case Success<List<PostModel>>():
          setState(SuccessState(result.value));
          break;
        case Failure<List<PostModel>>():
          setState(FailureState("Fetch data failure"));
          break;
      }
    } on Exception catch (e) {
      setState(FailureState("Fetch data failure"));
    }
  }
}