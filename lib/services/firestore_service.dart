import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sonoflow/models/user_model.dart';

/// Serviço de integração com o Firestore.
///
/// Fornece métodos para manipulação de dados de usuários no Firestore.
class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Registra um novo usuário no Firestore.
  ///
  /// [user]: Um objeto `UserModel` contendo os dados do usuário a serem salvos.
  ///
  /// Salva as informações básicas do usuário (`uid`, `username`, `email`,
  /// `registrationDate`, `sleepGoal` e `photoURL`) na coleção "users".
  ///
  /// Exceções:
  /// - Pode lançar uma `FirebaseException` em caso de falha na escrita dos dados.
  Future<void> registerUser(UserModel user) async =>
      await _db.collection("users").doc(user.uid).set({
        "uid": user.uid,
        "username": user.username,
        "email": user.email,
        "registrationDate": user.registrationDate,
        "sleepGoal": user.sleepGoal,
        "photoURL": user.photoUrl,
        // TODO: diaries
      });

  /// Obtém os dados de um usuário específico do Firestore.
  ///
  /// [user]: Um objeto `User` representando o usuário cuja informação será recuperada.
  ///
  /// Retorna um `Map<String, dynamic>` contendo os dados do usuário ou lança
  /// uma exceção em caso de falha.
  ///
  /// TODO: refatorar para usar DTOs
  Future<Map<String, dynamic>> getUserData(User user) async {
    DocumentSnapshot data = await _db.collection("users").doc(user.uid).get();
    Map<String, dynamic> dataMap = data.data() as Map<String, dynamic>;
    return dataMap;
  }

// TODO: saveDiary
}