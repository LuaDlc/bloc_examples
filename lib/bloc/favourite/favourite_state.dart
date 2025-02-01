// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:bloc_multiple_states/model/favourite_item_model.dart';

import '../../utils/enums.dart';

class FavouriteItemStates extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> itemfavouriteItemList;
  final ListStatus listStatus;
  const FavouriteItemStates({
    this.favouriteItemList = const [],
    this.listStatus = ListStatus.laoding,
    this.itemfavouriteItemList = const [],
  });

  FavouriteItemStates copyWith(
      {List<FavouriteItemModel>? favouriteItemList,
      List<FavouriteItemModel>? itemfavouriteItemList,
      ListStatus? listStatus}) {
    return FavouriteItemStates(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      itemfavouriteItemList:
          itemfavouriteItemList ?? this.itemfavouriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props =>
      [favouriteItemList, listStatus, itemfavouriteItemList];
}
