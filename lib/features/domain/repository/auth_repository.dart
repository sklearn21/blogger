import 'package:blogger/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Either<Failure, String> signUpWithEmailassword({
    required String email,
    required String password,
    required String name,
  });

  Either<Failure, String> loginWithEmailassword({
    required String email,
    required String password,
  });
}
