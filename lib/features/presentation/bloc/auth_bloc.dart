import 'package:blogger/features/domain/entities/user.dart';
import 'package:blogger/features/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSigUp>(
      (event, emit) async {
        emit(AuthLoading());

        final res = await _userSignUp(
          UserSignUpParams(
            email: event.email,
            password: event.password,
            name: event.name,
          ),
        );
        res.fold(
          (failure) => emit(AuthFailure(failure.messsage)),
          (user) => emit(AuthSuccess(user)),
        );
      },
    );
  }
}
