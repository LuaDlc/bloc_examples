import 'package:bloc_multiple_states/bloc/posts/posts_events.dart';
import 'package:bloc_multiple_states/bloc/posts/posts_states.dart';
import 'package:bloc_multiple_states/repository/post_repository.dart';
import 'package:bloc_multiple_states/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsBloc extends Bloc<PostsEvents, PostsStates> {
  PostRepository postRepository = PostRepository();
  PostsBloc() : super(const PostsStates()) {
    on<PostFetched>(fetchPostAPi);
  }

  void fetchPostAPi(PostFetched event, Emitter<PostsStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.sucess, message: 'sucess', postList: value));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }
}
