import 'helper_db.dart';

class AuthService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<bool> registerUser(String name, String email, String password, int age, String gender, double weight, double height) async {
      final user = {
        'name': name,
        'email': email,
        'password': password,
        'age': age,
        'gender': gender,
        'weight': weight,
        'height': height,
      };
      try {
        await _dbHelper.insertUser(user);
        return true;
      } catch (e) {
        print('Erro ao registrar usuário: $e');
        return false;
      }
    }

  Future<bool> loginUser(String email, String password) async {
    final user = await _dbHelper.getUser(email, password);
    return user != null;
  }
}
