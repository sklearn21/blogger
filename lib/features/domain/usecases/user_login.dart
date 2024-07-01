import 'package:blogger/core/error/failures.dart';
import 'package:blogger/core/usecase/usecase.dart';
import 'package:blogger/features/domain/entities/user.dart';
import 'package:blogger/features/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements Usecase<User, UserLoginParams> {
  final AuthRepository authRepository;

  UserLogin(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return authRepository.loginWithEmailPassword(
        email: params.email, password: params.password);
  }
}

final class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});
}
