import 'package:http/http.dart';
import 'package:rutter/data/services/login/login_api_provider.dart';

class LoginRepository {
  final LoginNetworkService networkService;
  LoginRepository(this.networkService);

  Future<Response> loginUser(String email, String password) async {
    return await networkService.login(email, password);
  }
}