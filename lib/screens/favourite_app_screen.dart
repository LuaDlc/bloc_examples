import 'package:bloc_multiple_states/bloc/favourite/favourite_bloc.dart';
import 'package:bloc_multiple_states/bloc/favourite/favourite_event.dart';
import 'package:bloc_multiple_states/bloc/favourite/favourite_state.dart';
import 'package:bloc_multiple_states/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/enums.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    super.initState();

    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteItemStates>(
              builder: (context, state) {
            return Visibility(
              visible: state.itemfavouriteItemList.isNotEmpty ? true : false,
              child: IconButton(
                  onPressed: () {
                    context.read<FavouriteBloc>().add(DeleteItem());
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<FavouriteBloc, FavouriteItemStates>(
            builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.laoding:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return const Text('somethinf wnt wrong');
            case ListStatus.success:
              return ListView.builder(
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItemList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                            value: state.itemfavouriteItemList.contains(item)
                                ? true
                                : false,
                            onChanged: (value) {
                              if (value!) {
                                context
                                    .read<FavouriteBloc>()
                                    .add(SelectItem(item: item));
                              } else {
                                context
                                    .read<FavouriteBloc>()
                                    .add(UnSelectItem(item: item));
                              }
                            }),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                            onPressed: () {
                              FavouriteItemModel itemModel = FavouriteItemModel(
                                id: item.id,
                                value: item.value,
                                isFavourite: item.isFavourite ? false : true,
                              );
                              context
                                  .read<FavouriteBloc>()
                                  .add(FavouriteItem(item: itemModel));
                            },
                            icon: Icon(item.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_outline)),
                      ),
                    );
                  });
          }
        }),
      ),
    );
  }
}
