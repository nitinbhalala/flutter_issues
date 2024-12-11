import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_issues/Module/CommentCubit/comment_state.dart';
import 'package:flutter_issues/main.dart';
import 'package:get/get.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(InitialCommentState()) {
    getFullIssuesList();
  }

  Future<void> getFullIssuesList() async {
    var argument = await Get.arguments;

    if (argument['comment'] != 0) {
      emit(DataLoadingState());
      try {
        apiService.getRequest(argument['comments_url']).then(
          (value) {
            emit(
              GetApiListState(value!.data ?? []),
            );
          },
        );
      } catch (e) {
        emit(
          ErrorState('Smoothing went wrong'),
        );
        print('catch Error:---${e.toString()}');
      }
    } else {
      emit(ErrorState('No comments'));
    }
  }
}
