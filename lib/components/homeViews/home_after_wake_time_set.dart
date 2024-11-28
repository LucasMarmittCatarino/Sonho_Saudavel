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
        // Mensagem sobre a qualidade do sono
        const Text(
          'Você dormiu bem ontem à noite.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w200,
            color: Color(0xFFBEBFC5),
          ),
        ),

        const SizedBox(height: 50),

        // Texto do tempo ideal de sono
        const Text(
          'Tempo ideal de sono:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),

        // Exibe o tempo ideal de sono
        RichText(
          text: TextSpan(
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

        // Imagem relacionada ao sono
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

        // Análise do sono
        const Text(
          'Recomendação de sono:',
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
              label: 'Deitar:',
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
