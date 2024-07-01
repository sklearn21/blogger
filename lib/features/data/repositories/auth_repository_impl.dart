import 'package:blogger/core/error/exceptions.dart';
import 'package:blogger/core/error/failures.dart';
import 'package:blogger/features/data/data_sources/auth_remote_data_source.dart';
import 'package:blogger/features/domain/entities/user.dart';
import 'package:blogger/features/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.loginWithEmailPassword(
          password: password, email: email);

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final user = await remoteDataSource.signUpWithEmailPassword(
          name: name, password: password, email: email);

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
