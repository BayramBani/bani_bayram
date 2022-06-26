import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';

import '../models/user_model.dart';

var log = Logger();

class UserService {
  final reference =
      FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
            fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
            toFirestore: (userModel, _) => userModel.toJson(),
          );

  Future<UserModel?> getUserByEmail(String email) async {
    UserModel? user;
    await reference.where("email", isEqualTo: email).get().then((value) {
      if (value.docs.isNotEmpty) {
        user = value.docs.first.data();
      }
    }).catchError((e) {
      log.e(e);
    });
    return user;
  }

  Future<String?> addUser(UserModel user) async {
    String? userID;
    user.createdAt = DateTime.now().toString();
    await reference.add(user).then((value) => userID = value.id).catchError((error) {
      log.e(error, 'Error while addUser');
    });
    return userID;
  }

  Future<bool> updateUser(String id, UserModel data) async {
    bool updated = false;
    data.updatedAt = DateTime.now().toString();
    await reference.doc(id).update(data.toJson()).then((value) {
      updated = true;
    }).catchError((error) {
      log.e(error, 'Error while updateUser');
    });
    return updated;
  }
}
