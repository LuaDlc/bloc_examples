import 'package:bloc_multiple_states/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../model/posts_model.dart';

class PostsStates extends Equatable {
  final PostStatus postStatus;
  final List<PostsModel> postList;
  final String message;

  const PostsStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostsModel>[],
    this.message = '',
  });

  PostsStates copyWith(
      {PostStatus? postStatus, List<PostsModel>? postList, String? message}) {
    return PostsStates(
      postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [postStatus, postList];
}
