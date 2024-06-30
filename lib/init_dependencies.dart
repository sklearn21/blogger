import 'package:blogger/core/secrets/app_secrets.dart';
import 'package:blogger/features/data/data_sources/auth_remote_data_source.dart';
import 'package:blogger/features/data/repositories/auth_repository_impl.dart';
import 'package:blogger/features/domain/repository/auth_repository.dart';
import 'package:blogger/features/domain/usecases/user_sign_up.dart';
import 'package:blogger/features/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
      url: AppSecrets.enterYourSupabaseUrl,
      anonKey: AppSecrets.enterYourSupabaseAnonKey);

  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
        serviceLocator(),
      ));

  serviceLocator.registerLazySingleton(
    () => UserSignUp(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
    ),
  );
}
