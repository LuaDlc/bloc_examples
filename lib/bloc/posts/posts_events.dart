import 'package:equatable/equatable.dart';

abstract class PostsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetched extends PostsEvents {}
