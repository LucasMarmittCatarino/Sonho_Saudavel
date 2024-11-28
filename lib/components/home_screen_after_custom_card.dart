import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import '../main.dart';
import '../utils/get_permission.dart';

class HomeScreenAfterCustomCard extends StatefulWidget {
  final String label;
  final String wakeUpTime;
  final String bedTime;

  const HomeScreenAfterCustomCard({
    super.key,
    required this.label,
    required this.wakeUpTime,
    required this.bedTime,
  });

  @override
  _HomeScreenAfterCustomCardState createState() =>
      _HomeScreenAfterCustomCardState();
}

class _HomeScreenAfterCustomCardState extends State<HomeScreenAfterCustomCard> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth - 40; // 20 de margem de cada lado

    return Container(
      width: containerWidth,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF151A2E),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF7A88A5),
            offset: Offset(0, 4),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Switch(
              value: isSwitched,
              onChanged: (value) async {
                setState(() {
                  isSwitched = value;
                });

                if (value) {
                  // Ativar alarmes
                  await _scheduleTestAlarms();
                } else {
                  // Cancelar alarmes
                  await _cancelAllAlarms();
                }
              },
              activeColor: const Color(0xFF7A88A5),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: const Color(0xFF151A2E),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _scheduleTestAlarms() async {
    final hasPermissions = await getPermissions();
    if (!hasPermissions) {
      // Caso as permissões não sejam concedidas, informe o usuário
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('As permissões necessárias não foram concedidas.'),
        ),
      );
      return;
    }

    String acordar = widget.wakeUpTime;
    String deitar = "7:40 AM";

    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    // Alarme de "acordar"
    final List<String> acordarSplit = acordar.split(' ');
    if (acordarSplit.length != 2) {
      // Se não estiver no formato correto, exibe erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Formato inválido para "acordar": $acordar'),
        ),
      );
      return;
    }

    final List<String> acordarHoraMinuto = acordarSplit[0].split(':');
    final bool isAcordarPM = acordarSplit[1] == 'PM';
    final tz.TZDateTime acordarTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      isAcordarPM
          ? int.parse(acordarHoraMinuto[0]) + 12
          : int.parse(acordarHoraMinuto[0]),
      int.parse(acordarHoraMinuto[1]),
    );

    // Se o horário de acordar já passou hoje, agende para amanhã
    final acordarFinal = acordarTime.isBefore(now) ? acordarTime.add(Duration(days: 1)) : acordarTime;

    // Alarme de "deitar"
    final List<String> deitarSplit = deitar.split(' ');
    if (deitarSplit.length != 2) {
      // Se não estiver no formato correto, exibe erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Formato inválido para "deitar": $deitar'),
        ),
      );
      return;
    }

    final List<String> deitarHoraMinuto = deitarSplit[0].split(':');
    final bool isDeitarPM = deitarSplit[1] == 'PM';
    final tz.TZDateTime deitarTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      isDeitarPM
          ? int.parse(deitarHoraMinuto[0]) + 12
          : int.parse(deitarHoraMinuto[0]),
      int.parse(deitarHoraMinuto[1]),
    );

    // Se o horário de deitar já passou hoje, agende para amanhã
    final deitarFinal = deitarTime.isBefore(now) ? deitarTime.add(Duration(days: 1)) : deitarTime;

    // Agende o alarme de "acordar"
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0, // ID único
      'Hora de acordar',
      'Bom dia! Hora de levantar!',
      acordarFinal,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your_channel_id',
          'your_channel_name',
          channelDescription: 'your_channel_description',
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );

    // Agende o alarme de "deitar"
    await flutterLocalNotificationsPlugin.zonedSchedule(
      1, // ID único
      'Hora de dormir',
      'Boa noite! Hora de descansar!',
      deitarFinal,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your_channel_id',
          'your_channel_name',
          channelDescription: 'your_channel_description',
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> _cancelAllAlarms() async {
    // Cancela todas as notificações agendadas
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
