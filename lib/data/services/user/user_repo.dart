import 'package:http/http.dart';
import 'package:rutter/data/services/user/user_api_provider.dart';

class UserRepository {
  final UserNetworkService networkService;
  UserRepository(this.networkService);

  Future<Response> getSelfUser() async {
    return await networkService.getSelfUser();
  }

  Future<Response> getUser(String username) async {
    return await networkService.getUser(username);
  } 
}