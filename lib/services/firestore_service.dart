import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Adiciona um novo usuário no Firestore
  Future<void> addUser({
    required String name,
    required String email,
    required String password,
    required int age,
    required String gender,
    required double weight,
    required int height,
    required Map<String, dynamic> sleepSchedule,
  }) async {
    try {
      await _firestore.collection('user').add({
        'name': name,
        'email': email,
        'password': password,
        'age': age,
        'sex': gender,
        'weight': weight.toString(),
        'height': height.toString(),
        'sleepSchedule': sleepSchedule,
      });
      print('Usuário cadastrado com sucesso no Firestore!');
    } catch (e) {
      print('Erro ao salvar os dados no Firestore: $e');
      rethrow;
    }
  }

  /// Busca um usuário no Firestore pelo email
  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    try {
      final snapshot = await _firestore
          .collection('user')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return null; // Retorna null se o usuário não for encontrado
      }

      return snapshot.docs.first.data(); // Retorna os dados do usuário como um Map
    } catch (e) {
      print('Erro ao buscar o usuário no Firestore: $e');
      rethrow;
    }
  }
  
    Future<void> updateUser(String email, Map<String, dynamic> data) async {
    try {
      final querySnapshot = await _firestore
          .collection('user')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs.first.id;
        await _firestore.collection('user').doc(docId).update(data);
        print('Usuário atualizado com sucesso!');
      } else {
        print('Usuário não encontrado para atualização.');
      }
    } catch (e) {
      print('Erro ao atualizar os dados do Firestore: $e');
      rethrow;
    }
  }
}
