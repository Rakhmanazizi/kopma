import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kopma/data/datasource/shared_preferences_service.dart';
import 'package:kopma/data/model/user/user_entity.dart';
import 'package:kopma/data/model/user/user_model.dart';
import 'package:kopma/data/user_repository.dart';
import 'package:kopma/di/service_locator.dart';

class FirebaseUserDataSource implements UserRepository {
  final usersCollection = FirebaseFirestore.instance.collection('users');
  final sharedPrefService = serviceLocator<SharedPreferencesService>();

  @override
  Future<void> setUserData(UserModel user) async {
    try {
      await usersCollection.doc(user.id).set(user.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<UserModel> getMyUser(String myUserId) async {
    try {
      return await usersCollection
          .doc(myUserId)
          .get()
          .whenComplete(() => {
                if (sharedPrefService.uid.isEmpty)
                  sharedPrefService.uid = myUserId
              })
          .then((value) =>
              UserModel.fromEntity(UserEntity.fromDocument(value.data()!)));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
