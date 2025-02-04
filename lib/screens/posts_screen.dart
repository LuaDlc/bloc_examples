import 'package:bloc_multiple_states/bloc/posts/posts_bloc.dart';
import 'package:bloc_multiple_states/bloc/posts/posts_events.dart';
import 'package:bloc_multiple_states/bloc/posts/posts_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/enums.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts APIs'),
      ),
      body: BlocBuilder<PostsBloc, PostsStates>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case PostStatus.failure:
            return Center(child: Text(state.message.toString()));
          case PostStatus.sucess:
            return Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Search with email',
                      border: OutlineInputBorder()),
                  onChanged: (firterKey) {
                    context.read<PostsBloc>().add(SearchItem(firterKey));
                  },
                ),
                Expanded(
                  child: state.searchMessage.isNotEmpty
                      ? Center(
                          child: Text(state.searchMessage.toString()),
                        )
                      : ListView.builder(
                          itemCount: state.tempList.isEmpty
                              ? state.postList.length
                              : state.tempList.length,
                          itemBuilder: (context, index) {
                            if (state.tempList.isNotEmpty) {
                              final item = state.tempList[index];
                              return Card(
                                child: ListTile(
                                  title: Text(item.email.toString()),
                                  subtitle: Text(item.body.toString()),
                                ),
                              );
                            } else {
                              final item = state.postList[index];
                              return Card(
                                child: ListTile(
                                  title: Text(item.email.toString()),
                                  subtitle: Text(item.body.toString()),
                                ),
                              );
                            }
                          }),
                ),
              ],
            );
        }
      }),
    );
  }
}
