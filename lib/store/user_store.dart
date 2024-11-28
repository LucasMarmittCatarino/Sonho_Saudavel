import 'package:flutter/foundation.dart';

class UserStore with ChangeNotifier {
  // Propriedades do usuário
  String? _name;
  String? _email;
  String? _password;
  int? _age;
  String? _gender;
  double? _weight;
  int? _height;
  Map<String, dynamic>? _sleepSchedule;

  // Getters para acessar os valores
  String? get userName => _name; // Alterado para userName
  String? get userEmail => _email; // Alterado para userEmail
  String? get password => _password;
  int? get age => _age;
  String? get gender => _gender;
  double? get weight => _weight;
  int? get height => _height;
  Map<String, dynamic>? get sleepSchedule => _sleepSchedule;

  // Método para definir o estado do usuário
  void setUser({
    required String name,
    required String email,
    required String password,
    required int age,
    required String gender,
    required double weight,
    required int height,
    required Map<String, dynamic> sleepSchedule,
  }) {
    _name = name;
    _email = email;
    _password = password;
    _age = age;
    _gender = gender;
    _weight = weight;
    _height = height;
    _sleepSchedule = sleepSchedule;
    notifyListeners(); // Notifica os ouvintes sobre a mudança
  }

  // Método para limpar o estado do usuário
  void clearUser() {
    _name = null;
    _email = null;
    _password = null;
    _age = null;
    _gender = null;
    _weight = null;
    _height = null;
    _sleepSchedule = null;
    notifyListeners(); // Notifica os ouvintes sobre a mudança
  }
}