import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class InitialHomeState extends HomeState {
  @override
  List<Object?> get props => [];
}

class GetApiListState extends HomeState {
  final List getListData;
  final List<dynamic> favorites;

  GetApiListState(this.getListData, this.favorites);

  @override
  List<Object?> get props => [getListData, favorites];
}

class DataLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends HomeState {
  final String errorMsg;

  ErrorState(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}

