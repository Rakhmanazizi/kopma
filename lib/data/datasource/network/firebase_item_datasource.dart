import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kopma/data/item_repository.dart';
import 'package:kopma/data/model/item/item_model.dart';
import 'package:kopma/data/model/transaction_model.dart';
import 'package:kopma/data/model/user/user_model.dart';

import '../../model/item/item_entity.dart';

class FirebaseItemDataSource implements ItemRepository {
  final itemsCollection = FirebaseFirestore.instance.collection('items');
  final itemsStorage = FirebaseStorage.instance.ref().child('/items');

  @override
  Future<TransactionModel> buyItem(ItemModel item, UserModel user) {
    // TODO: implement buyItem
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteItem(String itemId) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  getDetailItem() {
    // TODO: implement getDetailItem
    throw UnimplementedError();
  }

  @override
  Query<ItemModel> getListItem(String? query) {
    try {
      return itemsCollection.orderBy('name').withConverter(
          fromFirestore: (snapshot, options) =>
              ItemModel.fromEntity(ItemEntity.fromDocument(snapshot.data()!)),
          toFirestore: (value, options) =>
              value.toEntity(value.id!).toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<bool> postItem(ItemModel item) async {
    try {
      String id = itemsCollection.doc().id;
      return await itemsCollection
          .add(item.toEntity(id).toDocument())
          .then((value) => true);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<String> uploadImage(File file, String fileName) async {
    try {
      final TaskSnapshot snapshot =
          await itemsStorage.child(fileName).putFile(file);
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
