// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class PostsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetched extends PostsEvents {}

class SearchItem extends PostsEvents {
  final String stSearch;
  SearchItem(
    this.stSearch,
  );
}
