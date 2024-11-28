import 'package:flutter/material.dart';
import '../../utils/string_utils.dart';
import 'package:provider/provider.dart';
import '../../store/user_store.dart';
import '../../components/homeViews/home_after_wake_time_set.dart';
import '../../components/homeViews/home_before_wake_time_set.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Função para determinar a saudação com base na hora atual
  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Bom dia';
    } else if (hour >= 12 && hour < 18) {
      return 'Boa tarde';
    } else {
      return 'Boa noite';
    }
  }

  @override
  Widget build(BuildContext context) {
    final userStore = context.watch<UserStore>();
    final firstName = StringUtils.splitName(userStore.userName!)['firstName']!;
    final wakeUpTime = userStore.sleepSchedule?['wakeUpTime'];
    final sleepTimeAmount = userStore.sleepSchedule?['sleepTimeAmount'];

    return Scaffold(
      backgroundColor: const Color(0xFF080E1C),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
            // Texto dinâmico com base na hora do dia
            Text(
              '${getGreeting()}, $firstName!',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),

            // Exibe a tela com base no wakeUpTime
            wakeUpTime != null
              ? HomeAfterWakeTimeSet(wakeUpTime: wakeUpTime, sleepTimeAmount: sleepTimeAmount)
              : const HomeBeforeWakeTimeSet(),

          ],
        ),
      ),
    );
  }
}
