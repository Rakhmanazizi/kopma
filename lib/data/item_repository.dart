import 'dart:io';
import 'package:kopma/data/model/item/item_model.dart';
import 'package:kopma/data/model/transaction_model.dart';
import 'package:kopma/data/model/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ItemRepository {
  Query<ItemModel> getListItem(String? query);

  getDetailItem();

  Future<String> uploadImage(File file, String fileName);

  Future<bool> postItem(ItemModel item);

  Future<bool> deleteItem(String itemId);

  Future<TransactionModel> buyItem(ItemModel item, UserModel user);
}
