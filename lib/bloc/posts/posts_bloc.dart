import 'package:bloc_multiple_states/bloc/posts/posts_events.dart';
import 'package:bloc_multiple_states/bloc/posts/posts_states.dart';
import 'package:bloc_multiple_states/repository/post_repository.dart';
import 'package:bloc_multiple_states/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/posts_model.dart';

class PostsBloc extends Bloc<PostsEvents, PostsStates> {
  List<PostsModel> tempList = [];
  PostRepository postRepository = PostRepository();
  PostsBloc() : super(const PostsStates()) {
    on<PostFetched>(fetchPostAPi);
    on<SearchItem>(_filterList);
  }

  void fetchPostAPi(PostFetched event, Emitter<PostsStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.sucess, message: 'sucess', postList: value));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }

  void _filterList(SearchItem event, Emitter<PostsStates> emit) async {
    if (event.stSearch.isEmpty) {
      emit(state.copyWith(tempList: [], searchMessage: ''));
    } else {
      tempList = state.postList
          .where((element) => element.email
              .toString()
              .toLowerCase()
              .contains(event.stSearch.toLowerCase()))
          .toList();
      if (tempList.isEmpty) {
        emit(state.copyWith(tempList: tempList, searchMessage: 'Not found'));
      } else {
        emit(state.copyWith(tempList: tempList, searchMessage: ''));
      }
    }
  }
}
