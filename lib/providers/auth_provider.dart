// features/auth/presentation/auth_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/data_source.dart';
import '../models/user_model.dart';
import '../service_class/api_client.dart';

//https://nakshi.sonnoapp.co.uk/api
// ApiService provider
final apiServiceProvider = Provider((ref) => ApiService("https://nakshi.sonnoapp.co.uk/api"));

// Repository provider
final authRepositoryProvider = Provider((ref) => AuthRepository(ref.read(apiServiceProvider)));

// AsyncNotifier for login
class LoginNotifier extends AsyncNotifier<UserModel?> {
  @override
  Future<UserModel?> build() async => null;

  Future<void> loginEmail({required String email,required String password}) async {
    state = const AsyncLoading();
    try {
      final repo = ref.read(authRepositoryProvider);
      final response = await repo.login(email, password);
      state = AsyncData(response);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
  Future<void> loginPhone({required String phone,required String country, required String password}) async {
    state = const AsyncLoading();
    try {
      final repo = ref.read(authRepositoryProvider);
      final response = await repo.loginPhone(phone,country, password);
      state = AsyncData(response);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

final loginProvider = AsyncNotifierProvider<LoginNotifier, UserModel?>(LoginNotifier.new);
