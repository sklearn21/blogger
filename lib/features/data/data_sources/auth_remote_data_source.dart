import 'package:blogger/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String password,
    required String email,
  });

  Future<String> signInWithEmailPassword({
    required String password,
    required String email,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required this.supabaseClient});
  @override
  Future<String> signInWithEmailPassword(
      {required String password, required String email}) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword(
      {required String name,
      required String password,
      required String email}) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {'name': name});

      if (response.user == null) {
        throw ServerException(message: 'User is null');
      }

      return response.user!.id;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
