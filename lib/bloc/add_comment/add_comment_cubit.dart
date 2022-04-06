import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:rutter/bloc/comment/comment_cubit.dart';
import 'package:rutter/data/models/comment_model.dart';
import 'package:rutter/data/services/comment/comment_repo.dart';



part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  final CommentRepository repository;
  final CommentCubit commentCubit;
  AddCommentCubit(this.repository, this.commentCubit)
      : super(AddCommentInitial());

  void updateText(String text, int parent) {
    final currentState = state;
    if (currentState is AddingCommentDataChanged ||
        currentState is AddCommentInitial) {
      emit(AddingCommentDataChanged(
          comment: CommentModel(text: text, parent: parent))
      );
    }
  }


  void addComment(CommentModel Comment) {
    final currentState = state;
    emit(AddingComment());
    repository.addComment(Comment).then((response) {
      if (response.statusCode == 200) {
        var newComment = jsonDecode(response.body);
        emit(AddingCommentSuccess());
        emit(AddCommentInitial());
        commentCubit.addCommentToState(CommentModel.fromJson(newComment));
      } else if (response.statusCode == 400) {
        emit(AddingCommentError(comment: currentState.comment));
      }
    });
  }
}