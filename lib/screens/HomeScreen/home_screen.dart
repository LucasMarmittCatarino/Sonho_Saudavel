import 'package:flutter/material.dart';
import '../../components/home_screen_custom_card.dart';
import '../../utils/string_utils.dart';
import 'package:provider/provider.dart';
import '../../store/user_store.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userStore = context.watch<UserStore>();
    final firstName = StringUtils.splitName(userStore.userName!)['firstName']!;

    return Scaffold(
      backgroundColor: const Color(0xFF080E1C),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Atualiza a mensagem de bom dia com o primeiro nome
            Text(
              'Bom dia, $firstName!',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Você dormiu bem ontem à noite.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: Color(0xFFBEBFC5),
              ),
            ),

            const SizedBox(height: 50),

            const Text(
              'Tempo ideal de sono:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),

            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '8',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'h ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: '00',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'm',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset(
                  'lib/assets/png/moon.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Análise do sono:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 30),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeScreenCustomCard(
                  label: 'Deitou-se:',
                  time: '11:00 PM',
                  icon: Icons.hotel,
                ),
                HomeScreenCustomCard(
                  label: 'Acordou:',
                  time: '7:00 AM',
                  icon: Icons.alarm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
