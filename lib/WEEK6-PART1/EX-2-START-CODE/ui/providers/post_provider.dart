import 'package:flutter/material.dart';
import 'package:observer_w5/WEEK6-PART1/EX-2-START-CODE/model/post.dart';
import 'package:observer_w5/WEEK6-PART1/EX-2-START-CODE/repository/post_repository.dart';


enum AsyncValueState { loading, error, success }

class AsyncValue<T> {
  final T? data;
  final Object? error;
  final AsyncValueState state;

  const AsyncValue._({this.data, this.error, required this.state});

  factory AsyncValue.loading() => const AsyncValue._(state: AsyncValueState.loading);
  factory AsyncValue.success(T data) => AsyncValue._(data: data, state: AsyncValueState.success);
  factory AsyncValue.error(Object error) => AsyncValue._(error: error, state: AsyncValueState.error);
}

class PostsProvider extends ChangeNotifier {
  final PostRepository _repository;

  AsyncValue<List<Post>>? postValue;

  PostsProvider({required PostRepository repository}) : _repository = repository;

  Future<void> fetchPosts() async {
    postValue = AsyncValue.loading();
    notifyListeners();

    try {
      final posts = await _repository.getPosts();
      postValue = AsyncValue.success(posts);
    } catch (error) {
      postValue = AsyncValue.error(error);
    }

    notifyListeners();
  }
}
