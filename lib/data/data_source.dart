// features/user/domain/user_repository.dart

import '../models/user_model.dart';
import '../service_class/api_client.dart';

class AuthRepository {
  final ApiService api;
  AuthRepository(this.api);

  Future<UserModel> login(String email, String password) async {
    final data = await api.post('/login', {
      'email': email,
      'password': password,
    });
    return UserModel.fromJson(data['user']);
  }

  Future<UserModel> loginPhone(String phone,String country, String password) async {
    final data = await api.post('/login', {
      'phone': phone,
      'country_id': country,
      'password': password,
    });
    return UserModel.fromJson(data['user']);
  }
}
