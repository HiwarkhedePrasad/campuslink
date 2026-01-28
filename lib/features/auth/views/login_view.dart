// Inside your Login widget's login function
final authService = ref.read(authServiceProvider);
try {
  await authService.signIn(emailController.text, passwordController.text);
  // No need to navigate manually; AuthGate will catch the session change!
} catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
}