import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peperoni_test_quest/api/models/image_model.dart';
import 'package:peperoni_test_quest/screens/main/components/custom_text_widget.dart';
import 'package:peperoni_test_quest/screens/main/components/item_add_right_widget.dart';

class ItemProductWidget extends StatelessWidget {
  ImageModel? imageModel;
  String text;
  String subtext;
  WidgetRef parentRef;

  ItemProductWidget({
    Key? key,
    required this.imageModel,
    required this.text,
    required this.subtext,
    required this.parentRef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 244, 244, 252),   ///#F4F4FC
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: SizedBox(
        width: 153,
        child: Column(
          children: [
            (imageModel != null) ? Image.network(
              imageModel!.big!,
              width: 153,
            ) : const CircularProgressIndicator(),
            CustomTextWidget(text: text),
            CustomTextWidget(
              text: subtext,
              color: const Color.fromARGB(255, 99, 103, 115),
              fontSize: 10,
              padding: 33,
            ),
            ItemAddRightWidget(parentRef: parentRef, price: 25, isSmall: false),
          ],
        ),
      ),
    );
  }
}
