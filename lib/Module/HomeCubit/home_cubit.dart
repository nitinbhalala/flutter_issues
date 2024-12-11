import 'dart:convert';
import 'package:flutter_issues/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_issues/Services/Api/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_issues/Module/HomeCubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState()) {
    loadFavorites();
  }

  List<int> favorites = [];

  Future<void> getFullIssuesList() async {
    emit(DataLoadingState());
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
        ? List<int>.from(jsonDecode(savedFavorites))
        : [];
  }

  Future<void> toggleFavorite(int id, List<dynamic> currentList) async {
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('favorites', jsonEncode(favorites));

    emit(
      GetApiListState(
        List<dynamic>.from(currentList),
        List<int>.from(favorites),
      ),
    );
  }
}
