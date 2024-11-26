import 'package:flutter/material.dart';
import '../ProfileDetailsScreen/profile_details_screen.dart';
import '../ConfigurationScreen/configuration_screen.dart';
import '../../utils/string_utils.dart';
import '../../store/user_store.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém o estado do usuário a partir da store
    final userStore = context.watch<UserStore>();
    final userName = userStore.userName;
    final userEmail = userStore.userEmail;

    // Divide o nome em partes
    final nameParts = StringUtils.splitName(userName!);
    final firstName = nameParts['firstName']!;
    final lastName = nameParts['lastName']!;

    return Scaffold(
      backgroundColor: const Color(0xFF080E1C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'lib/assets/png/profile_man.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    firstName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    lastName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(
              width: 230,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfileDetailsScreen(userEmail: userEmail!),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF141B2E),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: const Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Sobre mim',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 230,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfigurationScreen(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF141B2E),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: const Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.settings, color: Colors.white),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Configuração',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
