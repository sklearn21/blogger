import 'package:blogger/core/error/exceptions.dart';
import 'package:blogger/core/error/failures.dart';
import 'package:blogger/features/data/data_sources/auth_remote_data_source.dart';
import 'package:blogger/features/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailPassword(
          name: name, password: password, email: email);

      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
