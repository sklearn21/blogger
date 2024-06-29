import 'package:blogger/core/secrets/app_secrets.dart';
import 'package:blogger/core/theme/theme.dart';
import 'package:blogger/features/presentation/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: AppSecrets.enterYourSupabaseUrl,
      anonKey: AppSecrets.enterYourSupabaseAnonKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blogger',
      theme: AppTheme.darkThemeMode,
      home: const SignInPage(),
    );
  }
}
