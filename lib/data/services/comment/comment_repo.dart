import 'package:http/http.dart';
import 'package:rutter/data/models/comment_model.dart';
import 'package:rutter/data/services/comment/comment_api_provider.dart';

class CommentRepository {
  final CommentNetworkService networkService;
  CommentRepository(this.networkService);

  Future<Response> getComments(int tweetId) async {
    return await networkService.fetchComments(tweetId);
  }

  Future<Response> addComment(CommentModel comment) async {
    return await networkService.addComment(comment);
  }
}