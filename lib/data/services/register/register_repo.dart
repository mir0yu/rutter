import 'package:http/http.dart';
import 'package:rutter/data/services/register/register_api_provider.dart';

class RegisterRepository {
  final RegisterNetworkService networkService;
  RegisterRepository(this.networkService);

  Future<Response> registerUser(
      String username, String email, String password) async {
    return await networkService.register(username, email, password);
  }
}