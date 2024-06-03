import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final String category;
  final String description;
  final int quantity;
  final int price;

  const ItemEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.description,
    required this.quantity,
    required this.price,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'category': category,
      'description': description,
      'quantity': quantity,
      'price': price,
    };
  }

  static ItemEntity fromDocument(Map<String, dynamic> doc) {
    return ItemEntity(
      id: doc['id'] as String,
      name: doc['name'] as String,
      image: doc['image'] as String,
      category: doc['category'] as String,
      description: doc['description'] as String,
      quantity: doc['quantity'],
      price: doc['price'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        category,
        description,
        quantity,
        price,
      ];

  @override
  String toString() {
    return '''ItemEntity: {
     id: $id
     name: $name
     image: $image
     category: $category
     description: $description
     quantity: $quantity
     price: $price
   }''';
  }
}
