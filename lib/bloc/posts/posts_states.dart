// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:bloc_multiple_states/utils/enums.dart';

import '../../model/posts_model.dart';

class PostsStates extends Equatable {
  final PostStatus postStatus;
  final List<PostsModel> postList;
  final List<PostsModel> tempList;
  final String message;
  final String searchMessage;

  const PostsStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostsModel>[],
    this.tempList = const <PostsModel>[],
    this.message = '',
    this.searchMessage = '',
  });

  PostsStates copyWith(
      {PostStatus? postStatus,
      List<PostsModel>? postList,
      String? message,
      List<PostsModel>? tempList,
      String? searchMessage}) {
    return PostsStates(
      postList: postList ?? this.postList,
      tempList: tempList ?? this.tempList,
      postStatus: postStatus ?? this.postStatus,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [postStatus, postList, tempList, searchMessage];
}
