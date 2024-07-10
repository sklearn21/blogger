import 'package:blogger/features/domain/entities/user.dart';
import 'package:blogger/features/domain/usecases/user_login.dart';
import 'package:blogger/features/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  AuthBloc({required UserSignUp userSignUp, required UserLogin userLogin})
      : _userSignUp = userSignUp,
        _userLogin = userLogin,
        super(AuthInitial()) {
    on<AuthSigUp>((event, emit) async {
      _onAuthSignUp;
    });

    on<AuthLogin>((event, emit) async {
      debugPrint('AuthLogin bloc execution');
      _onAuthLogin(event, emit);
    });
  }
  void _onAuthSignUp(AuthSigUp event, Emitter<AuthState> emit) async {
    debugPrint('AuthLogin bloc auth signup event execution 2');

    emit(AuthLoading());
    debugPrint('AuthLogin bloc execution 3');

    final res = await _userSignUp(
      UserSignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );
    debugPrint(res.toString());

    res.fold(
      (failure) => emit(AuthFailure(failure.messsage)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    debugPrint('AuthLogin bloc execution 2');

    emit(AuthLoading());

    final res = await _userLogin(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(failure.messsage)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
