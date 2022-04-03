import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rutter/data/models/comment_model.dart';
import 'package:rutter/data/services/comment/comment_repo.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final CommentRepository repository;

  CommentCubit(this.repository) : super(CommentInitial());
  void fetchTasks(int tweetId) {
    emit(CommentsLoading());
    repository.getComments(tweetId).then((response) {
      if (response.statusCode == 200) {
        var rawComments = jsonDecode(response.body) as List;
        List<CommentModel> comments =
        rawComments.map((comment) => CommentModel.fromJson((comment))).toList();
        emit(CommentsLoaded(comments: comments));
      } else {
        emit(CommentsLoadingError());
      }
    });
  }
}
