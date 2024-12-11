import 'dart:convert';
import 'package:flutter_issues/Global/preference.dart';
import 'package:flutter_issues/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_issues/Services/Api/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_issues/Module/HomeCubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState()) {
    loadFavorites();
  }

  List<dynamic> favorites = [];

  Future<void> getFullIssuesList() async {
    emit(DataLoadingState());

    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(ErrorState(noNetMsg));
      return;
    }

    try {
      apiService.getRequest(ApiUrl.baseUrl).then((value) {
        if (value != null && value.data != null) {
          emit(GetApiListState(value.data, favorites));
        } else {
          emit(ErrorState('No data found'));
        }
      });
    } catch (e) {
      emit(ErrorState('Something went wrong: ${e.toString()}'));
    }
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final savedFavorites = prefs.getString('favorites');

    favorites = savedFavorites != null
        ? List<dynamic>.from(jsonDecode(savedFavorites).map((e) => e))
        : [];
    getFullIssuesList();
  }

  Future<void> toggleFavorite(int id, List<dynamic> currentList) async {
    final selectedItem = currentList.firstWhere((item) => item['id'] == id);

    if (favorites.any((item) => item['id'] == id)) {
      favorites.removeWhere(
          (item) => item['id'] == id); // Remove object from favorites
    } else {
      favorites.add(selectedItem); // Add full object to favorites
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('favorites', jsonEncode(favorites)); // Save full objects

    emit(
      GetApiListState(
        List<dynamic>.from(currentList),
        List<dynamic>.from(favorites),
      ),
    );
  }
}
