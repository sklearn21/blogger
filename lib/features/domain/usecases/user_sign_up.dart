import 'package:blogger/core/error/failures.dart';
import 'package:blogger/core/usecase/usecase.dart';
import 'package:blogger/features/domain/entities/user.dart';
import 'package:blogger/features/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements Usecase<User, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
        email: params.email, password: params.password, name: params.name);
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams(
      {required this.email, required this.password, required this.name});
}
