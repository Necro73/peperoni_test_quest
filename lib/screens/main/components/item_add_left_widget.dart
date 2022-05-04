import 'package:flutter/material.dart';
import 'package:peperoni_test_quest/api/models/image_model.dart';

class ItemAddLeftWidget extends StatelessWidget {
  ImageModel? image;
  String text;

  ItemAddLeftWidget({
    Key? key,
    required this.image,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: (image != null) ? Image.network(image!.big!) : const CircularProgressIndicator(),
          ),
          Text(text),
        ],
      ),
    );
  }
}
