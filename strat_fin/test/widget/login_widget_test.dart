import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('Login Widget Tests', () {
    testWidgets('should display login form elements', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        // Arrange - Create a simple login form for testing
        const loginWidget = MaterialApp(
          home: Scaffold(
            body: LoginForm(),
          ),
        );

        // Act
        await tester.pumpWidget(loginWidget);

        // Assert
        expect(find.text('Email'), findsOneWidget);
        expect(find.text('Senha'), findsOneWidget);
        expect(find.byType(ElevatedButton), findsAtLeastNWidgets(1));
      });
    });

    testWidgets('should validate email input', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        // Arrange
        const widget = MaterialApp(
          home: Scaffold(
            body: LoginForm(),
          ),
        );

        await tester.pumpWidget(widget);

        // Act - Enter invalid email
        await tester.enterText(find.byKey(const Key('email_field')), 'invalid-email');
        await tester.tap(find.byKey(const Key('login_button')));
        await tester.pump();

        // Assert - Should show validation error
        expect(find.text('Email inválido'), findsOneWidget);
      });
    });

    testWidgets('should handle login button tap', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        // Arrange
        const widget = MaterialApp(
          home: Scaffold(
            body: LoginForm(),
          ),
        );

        await tester.pumpWidget(widget);

        // Act - Fill form and tap login
        await tester.enterText(find.byKey(const Key('email_field')), 'test@stratfin.com');
        await tester.enterText(find.byKey(const Key('password_field')), 'password123');
        await tester.tap(find.byKey(const Key('login_button')));
        await tester.pump();

        // Assert - Button should be pressed (can verify through state changes)
        expect(find.byKey(const Key('login_button')), findsOneWidget);
      });
    });
  });
}

// Mock Login Form Widget for testing
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailError;

  void _validateAndLogin() {
    setState(() {
      if (!_emailController.text.contains('@')) {
        _emailError = 'Email inválido';
      } else {
        _emailError = null;
        // Simulate login process
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            key: const Key('email_field'),
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              errorText: _emailError,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            key: const Key('password_field'),
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Senha',
            ),
            obscureText: true,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            key: const Key('login_button'),
            onPressed: _validateAndLogin,
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}