import 'package:flutter/material.dart';
import '../home_screen_custom_card.dart';
import '../../utils/calculate_bed_time.dart';

class HomeAfterWakeTimeSet extends StatelessWidget {
  final String wakeUpTime;
  final int sleepTimeAmount;

  const HomeAfterWakeTimeSet({
    super.key,
    required this.wakeUpTime,
    required this.sleepTimeAmount,
  });

  @override
  Widget build(BuildContext context) {

    final bedTime = calculateBedTime(wakeUpTime, sleepTimeAmount);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 20),

        Text(
          'Com base nas suas informações, seu tempo ideal de sono é de $sleepTimeAmount horas.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 30),

        // Análise do sono
        const Text(
          'Recomendação de cronograma:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 30),

        // Cards com informações de sono
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeScreenCustomCard(
              label: 'Deitar-se:',
              time: bedTime,
              icon: Icons.hotel,
            ),
            HomeScreenCustomCard(
              label: 'Acordar:',
              time: wakeUpTime,
              icon: Icons.alarm,
            ),
          ],
        ),

      ],
    );
  }
}
