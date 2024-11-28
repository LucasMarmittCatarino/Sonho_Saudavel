import 'package:intl/intl.dart';

String calculateBedTime(String wakeUpTimeString, int sleepTimeAmount) {
  try {
    // Usar parseLoose para lidar com espaços não separáveis
    final wakeUpTime = DateFormat.jm().parseLoose(wakeUpTimeString);

    // Convertendo wakeUpTime para número correspondente (hora no formato 24h)
    int wakeUpHour = wakeUpTime.hour;
    int wakeUpMinute = wakeUpTime.minute;

    // Subtraindo sleepTimeAmount (em horas) do wakeUpHour
    int bedTimeHour = wakeUpHour - sleepTimeAmount;
    if (bedTimeHour < 0) {
      bedTimeHour += 24; // Ajustar para valores negativos
    }

    // Ajustando a lógica para garantir o formato correto de AM/PM
    final DateTime bedTime = DateTime(0, 1, 1, bedTimeHour, wakeUpMinute);

    // Formatando o horário calculado para exibição
    return DateFormat.jm().format(bedTime); // Exemplo: '4:15 PM'
  } catch (e) {
    return 'Erro ao calcular horário: $e';
  }
}
