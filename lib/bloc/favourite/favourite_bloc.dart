import 'package:bloc_multiple_states/bloc/favourite/favourite_event.dart';
import 'package:bloc_multiple_states/bloc/favourite/favourite_state.dart';
import 'package:bloc_multiple_states/model/favourite_item_model.dart';
import 'package:bloc_multiple_states/repository/favourite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteItemStates> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> itemfavouriteList = [];
  // Repositório para buscar os itens.
  FavouriteRepository favouriteRepository;
  FavouriteBloc(this.favouriteRepository) : super(const FavouriteItemStates()) {
    // Registra os eventos e associa cada evento a um método correspondente.
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(addFavouriteItem);
    on<SelectItem>(selectItem as EventHandler<SelectItem, FavouriteItemStates>);
    on<UnSelectItem>(unSelectItem);
    on<DeleteItem>(deleteItem);
  }

  void fetchList(
      FetchFavouriteList event, Emitter<FavouriteItemStates> emit) async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success));
  }

  void addFavouriteItem(
      FavouriteItem event, Emitter<FavouriteItemStates> emit) async {
    final index =
        favouriteList.indexWhere((element) => element.id == event.item.id);

    if (event.item.isFavourite) {
      if (itemfavouriteList.contains(favouriteList[index])) {
        itemfavouriteList.remove(favouriteList[index]);
        itemfavouriteList.add(event.item);
      }
    } else {
      if (itemfavouriteList.contains(favouriteList[index])) {
        itemfavouriteList.remove(favouriteList[index]);
        itemfavouriteList.add(event.item);
      }
    }

    favouriteList[index] = event.item;
    emit(
      state.copyWith(
          favouriteItemList: List.from(favouriteList),
          itemfavouriteItemList: List.from(itemfavouriteList)),
    );
  }

  void selectItem(SelectItem event, Emitter<FavouriteItemStates> emit) async {
    itemfavouriteList.add(event.item);
    emit(state.copyWith(itemfavouriteItemList: List.from(itemfavouriteList)));
  }

  void unSelectItem(
      UnSelectItem event, Emitter<FavouriteItemStates> emit) async {
    itemfavouriteList.remove(event.item);
    emit(state.copyWith(itemfavouriteItemList: List.from(itemfavouriteList)));
  }

  void deleteItem(DeleteItem event, Emitter<FavouriteItemStates> emit) async {
    for (int i = 0; i < itemfavouriteList.length; i++) {
      favouriteList.remove(itemfavouriteList[i]);
    }
    itemfavouriteList.clear();

    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        itemfavouriteItemList: List.from(itemfavouriteList)));
  }
}
