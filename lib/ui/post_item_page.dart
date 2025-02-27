import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kopma/bloc/item_bloc/item_bloc.dart';
import 'package:kopma/data/model/item/item_model.dart';
import 'component/text_field.dart';

class PostItemPage extends StatefulWidget {
  const PostItemPage({super.key});

  @override
  State<PostItemPage> createState() => _PostItemPageState();
}

class _PostItemPageState extends State<PostItemPage> {
  final ImagePicker picker = ImagePicker();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  String categoriesValue = 'Books';
  final categories = [
    'Books',
    'Business & Industrial',
    'Clothing, Shoes & Accessories',
    'Collectibles',
    'Consumer Electronics',
    'Crafts',
    'Dolls & Bears',
    'Home & Garden',
    'Motors',
    'Pet Supplies',
    'Sporting Goods',
    'Sports Mem, Cards & Fan Shop',
    'Toys & Hobbies',
    'Antiques',
    'Computers/Tablets & Networking'
  ];

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://via.assets.so/img.jpg?w=800&h=800&tc=&bg=#cecece&t=Image";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Item"),
      ),
      body: BlocListener<ItemBloc, ItemState>(
        listener: (context, state) {},
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ItemBloc, ItemState>(builder: (context, state) {
                imageUrl = state.imageUrl ??
                    "https://via.assets.so/img.jpg?w=800&h=800&tc=&bg=#cecece&t=Image";
                return CachedNetworkImage(
                  imageUrl: imageUrl,
                );
              }),
              IconButton(
                  onPressed: () async {
                    final XFile? images =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (context.mounted) {
                      context.read<ItemBloc>().add(UploadImage(
                          file: File(images!.path), fileName: images.name));
                    }
                  },
                  icon: const Icon(Icons.image)),
              MyTextField(
                  controller: nameController,
                  hintText: 'Item\'s name',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in this field';
                    }
                    return null;
                  }),
              const Padding(padding: EdgeInsets.all(4)),
              MyTextField(
                  controller: descriptionController,
                  hintText: 'Item\'s description',
                  obscureText: false,
                  keyboardType: TextInputType.multiline,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in this field';
                    }
                    return null;
                  }),
              DropdownButton(
                // Initial Value
                value: categoriesValue,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: categories.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    categoriesValue = newValue!;
                  });
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextField(
                      controller: quantityController,
                      hintText: 'Item\'s quantity',
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        }
                        return null;
                      }),
                  const Padding(padding: EdgeInsets.all(4)),
                  MyTextField(
                      controller: priceController,
                      hintText: 'Item\'s price',
                      obscureText: false,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        }
                        return null;
                      }),
                  const Padding(padding: EdgeInsets.all(4)),
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          context.read<ItemBloc>().add(PostItem(
                              item: ItemModel(
                                  name: nameController.text,
                                  image: imageUrl,
                                  category: categoriesValue,
                                  description: descriptionController.text,
                                  quantity: int.parse(quantityController.text),
                                  price: int.parse(priceController.text))));
                        });
                      },
                      icon: const Icon(Icons.upload),
                      label: const Text("Upload item"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
