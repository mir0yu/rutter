import 'package:http/http.dart';
import 'package:rutter/data/services/comment/comment_api_provider.dart';

class CommentRepository {
  final CommentNetworkService networkService;
  CommentRepository(this.networkService);

  Future<Response> getComments(int tweetId) async {
    return await networkService.getComments(tweetId);
  }
}