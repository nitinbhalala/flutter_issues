import 'package:equatable/equatable.dart';

abstract class CommentState extends Equatable {}

class InitialCommentState extends CommentState {
  @override
  List<Object?> get props => [];
}

class GetApiListState extends CommentState {
  final List getListData;

  GetApiListState(this.getListData);

  @override
  List<Object?> get props => [getListData];
}

class DataLoadingState extends CommentState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends CommentState {
  final String errorMsg;

  ErrorState(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
