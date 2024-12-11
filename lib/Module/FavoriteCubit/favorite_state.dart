import 'package:equatable/equatable.dart';

abstract class FavoriteState extends Equatable {}

class InitialHomeState extends FavoriteState {
  @override
  List<Object?> get props => [];
}

class GetFavoriteListState extends FavoriteState {
  final List<dynamic> favorites;

  GetFavoriteListState(this.favorites);

  @override
  List<Object?> get props => [favorites];
}

class DataLoadingState extends FavoriteState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends FavoriteState {
  final String errorMsg;

  ErrorState(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
