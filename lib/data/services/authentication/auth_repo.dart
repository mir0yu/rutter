import 'package:rutter/data/services/authentication/auth_api_provider.dart';

class AuthenticationRepository {
  final AuthenticationNetworkService networkService;
  AuthenticationRepository(this.networkService);

  Future<bool> auth() async {
    return await networkService.auth();
  }
}