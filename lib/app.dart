import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import your features/screens
import 'features/auth/views/login_view.dart';
import 'features/auth/providers/auth_provider.dart'; // Where authStateProvider lives
import 'features/navigation/main_screen.dart'; // Adjust path if needed

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampusLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      // This is the gatekeeper that decides which screen to show
      home: const AuthGate(),
    );
  }
}

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching the auth state from Supabase
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (data) {
        final session = data.session;
        if (session != null) {
          return const MainScreen(); // Show main app if logged in
        }
        return const LoginView(); // Show login if not logged in
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, trace) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
  }
}
