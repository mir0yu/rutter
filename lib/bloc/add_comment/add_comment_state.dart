part of 'add_comment_cubit.dart';

abstract class AddCommentState {
  late CommentModel comment;
}

class AddCommentInitial extends AddCommentState {

}

class AddingCommentDataChanged extends AddCommentState {
  final CommentModel comment;
  AddingCommentDataChanged({required this.comment});
}

class AddingComment extends AddCommentState {}

class AddingCommentSuccess extends AddCommentState {}

class AddingCommentError extends AddCommentState {
  final CommentModel comment;
  AddingCommentError({required this.comment});
}