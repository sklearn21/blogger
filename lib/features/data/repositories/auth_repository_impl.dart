import 'package:blogger/core/error/exceptions.dart';
import 'package:blogger/core/error/failures.dart';
import 'package:blogger/features/data/data_sources/auth_remote_data_source.dart';
import 'package:blogger/features/domain/entities/user.dart';
import 'package:blogger/features/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(() async => await remoteDataSource.loginWithEmailPassword(
          password: password,
          email: email,
        ));
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword(
      {required String email,
      required String password,
      required String name}) async {
    return _getUser(() async => await remoteDataSource.signUpWithEmailPassword(
        password: password, email: email, name: name));
  }

  Future<Either<Failure, User>> _getUser(Future<User> Function() fn) async {
    try {
      final user = await fn();

      return right(user);
    } on sb.AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
