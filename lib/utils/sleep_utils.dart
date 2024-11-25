class SleepUtils {
  /// Calcula o tempo ideal de sono baseado na idade.
  static int calculateIdealSleepTime(int age) {
    if (age < 6) return 11; // Crianças pequenas
    if (age <= 13) return 10; // Crianças em idade escolar
    if (age <= 17) return 9; // Adolescentes
    if (age <= 64) return 8; // Adultos
    return 7; // Idosos
  }
}