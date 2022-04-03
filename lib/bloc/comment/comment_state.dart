part of 'comment_cubit.dart';

@immutable
abstract class CommentState {
  late List<CommentModel> comments;
}

class CommentInitial extends CommentState {}

//! Comment load states
class CommentsLoading extends CommentState {}

class CommentsLoaded extends CommentState {
  final List<CommentModel> comments;

  CommentsLoaded({required this.comments});
}

class CommentsLoadingError extends CommentState {}