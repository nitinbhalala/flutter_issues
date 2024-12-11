import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_issues/Global/preference.dart';
import 'package:flutter_issues/Module/CommentCubit/comment_state.dart';
import 'package:flutter_issues/main.dart';
import 'package:get/get.dart';

class CommentCubit extends Cubit<CommentState> {
  String title = '';
  String number = '';
  CommentCubit() : super(InitialCommentState()) {
    getFullIssuesList();
  }

  Future<void> getFullIssuesList() async {
    var argument = await Get.arguments;
    title = argument['title'] ?? '';
    number = argument['issueNumber'].toString();
    if (argument['comment'] != 0) {
      emit(DataLoadingState());

      final connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(ErrorState(noNetMsg));
        return;
      }

      try {
        apiService.getRequest(argument['comments_url']).then(
          (value) {
            emit(
              GetApiListState(value!.data ?? []),
            );
          },
        );
      } catch (e) {
        emit(ErrorState('Smoothing went wrong'));
        print('catch Error:---${e.toString()}');
      }
    } else {
      emit(
        GetApiListState(const []),
      );
    }
  }
}
