import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_issues/Global/preference.dart';
import 'package:flutter_issues/Module/FavoriteCubit/favorite_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(InitialHomeState()) {
    loadFavorites();
  }

  List<dynamic> favorites = []; // This will store the favorite items

  Future<void> loadFavorites() async {
    emit(DataLoadingState());
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedFavorites = prefs.getString('favorites');
      favorites = savedFavorites != null
          ? List<dynamic>.from(
              jsonDecode(savedFavorites).map((e) => e)) // Decode full objects
          : [];
      emit(GetFavoriteListState(favorites));
    } catch (e) {
      emit(ErrorState("Something went wrong"));
    }
  }

  Future<void> deleteFavorite(int index) async {
    try {
      isUpdate = true;
      favorites.removeAt(index); // Remove the item at the specified index
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'favorites', jsonEncode(favorites)); // Save the updated list
      emit(GetFavoriteListState(favorites)); // Emit the updated list
    } catch (e) {
      emit(ErrorState("Failed to delete the item"));
    }
  }
}
