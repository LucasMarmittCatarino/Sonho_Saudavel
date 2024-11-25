class StringUtils {
  /// Divide um nome completo em primeiro nome e sobrenome.
  static Map<String, String> splitName(String fullName) {
    final parts = fullName.split(' ');
    final firstName = parts.first;
    final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';
    return {'firstName': firstName, 'lastName': lastName};
  }
}