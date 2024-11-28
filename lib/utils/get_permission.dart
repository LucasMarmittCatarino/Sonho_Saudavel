import 'package:permission_handler/permission_handler.dart';

Future<bool> getPermissions() async {
  // Solicitar permissão para notificações (Android 13 ou superior)
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }

  // Verifique se a permissão para alarmes exatos foi concedida (Android 12 ou superior)
  if (await Permission.scheduleExactAlarm.isDenied) {
    final status = await Permission.scheduleExactAlarm.request();
    if (status.isDenied) {
      // A permissão foi negada, informe ao usuário
      return false;
    }
  }

  return true;
}
