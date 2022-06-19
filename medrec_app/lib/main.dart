import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medrec_app/providers/auth_provider.dart';
import 'package:medrec_app/screens/login_page.dart';
import 'package:medrec_app/utils/routes.dart';
import 'package:medrec_app/utils/themes.dart';

import 'screens/home_page.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(const ProviderScope(child: MedRecApp()));
}

class MedRecApp extends ConsumerStatefulWidget {
  const MedRecApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MedRecAppState();
}

class _MedRecAppState extends ConsumerState<MedRecApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedRec',
      theme: MedRecTheme.mainTheme(),
      debugShowCheckedModeBanner: false,
      home: const AuthChecker(),
      onGenerateRoute: (settings) => MedRecRoutes.generateRoute(settings),
    );
  }
}

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(currentUserProvider);
    if (isLoggedIn == true) {
      return const HomePage(); // It's a simple basic screen showing the home page
    } else if (isLoggedIn == false) {
      return const LoginPage(); // It's the intro screen we made
    }
    return const LoadingScreen(); // It's a plain screen with a circular progress indicator in Center
  }
}
