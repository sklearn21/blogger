import 'package:blogger/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);

  ///This call function is a unique function when it is inside a class.
  ///
}
