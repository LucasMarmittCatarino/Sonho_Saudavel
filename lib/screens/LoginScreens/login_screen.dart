import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../LoginScreens/auth_screen.dart';
import '../LoginScreens/recover_password_screen.dart';
import '../../navigations/bottom_tab_navigator.dart';
import '../../services/firestore_service.dart';
import '../../store/user_store.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
      return;
    }

    try {
      final user = await _firestoreService.getUserByEmail(email);

      if (user != null && user['password'] == password) {
        final userStore = Provider.of<UserStore>(context, listen: false);

        // Salva os dados no estado global usando setUser
        userStore.setUser(
          name: user['name'],
          email: user['email'],
          password: user['password'],
          age: user['age'],
          gender: user['sex'], // Se for 'sex' no Firestore, mantenha assim
          weight: double.parse(user['weight']),
          height: int.parse(user['height']),
          sleepSchedule: user['sleepSchedule'],
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomTabNavigator(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email ou senha incorretos')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao tentar fazer login')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const AuthScreen()),
              (route) => false,
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF393839)),
              ),
              const SizedBox(height: 55),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color.fromARGB(143, 57, 56, 57)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Color(0xFF393839)),
                  ),
                ),
              ),
              const SizedBox(height: 26),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Color.fromARGB(143, 57, 56, 57)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, color: Color(0xFF393839)),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecoverPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(fontWeight: FontWeight.w400, color: Color.fromARGB(123, 57, 56, 57)),
                  ),
                ),
              ),
              const SizedBox(height: 26),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _login, // Chama a função de login
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF504EB4),
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
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
