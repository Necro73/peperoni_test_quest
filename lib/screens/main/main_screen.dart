import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peperoni_test_quest/api/models/data_model.dart';
import 'package:peperoni_test_quest/logic/load_data/load_data_notifier.dart';
import 'package:peperoni_test_quest/screens/main/components/button_size_widget.dart';
import 'package:peperoni_test_quest/screens/main/components/circle_indicator_widget.dart';
import 'package:peperoni_test_quest/screens/main/components/custom_text_widget.dart';
import 'package:peperoni_test_quest/screens/main/components/item_add_left_widget.dart';
import 'package:peperoni_test_quest/screens/main/components/item_add_right_widget.dart';
import 'package:peperoni_test_quest/screens/main/components/item_product_widget.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DataModel loadDataWatch = ref.watch(loadDataProvider.select((value) => value));
    return Material(
      color: const Color.fromARGB(255, 252, 254, 255),
      child: Scaffold(
        body: Stack(
          children: [
            (loadDataWatch.imagesList != null && loadDataWatch.imagesList![0].big != null)
                ? Image.network(loadDataWatch.imagesList![0].big!)
                : const Padding(
                    padding: EdgeInsets.only(top: 175),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CircularProgressIndicator(),
                    ),
                  ),
            ListView(
              children: [
                const SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleIndicatorWidget(color: const Color.fromARGB(255, 220, 94, 49)),
                    CircleIndicatorWidget(),
                    CircleIndicatorWidget(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${loadDataWatch.title}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        CustomTextWidget(
                          text: '${loadDataWatch.weight} г  /  ${loadDataWatch.calorie} кКал',
                          color: const Color.fromARGB(255, 99, 103, 115),
                          fontSize: 10,
                        ),
                        CustomTextWidget(
                          text: '${loadDataWatch.description}',
                          padding: 14,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Окно удаления ингредиентов');
                          },
                          child: CustomTextWidget(
                            text: 'Убрать ингридиенты',
                            color: const Color.fromARGB(255, 220, 94, 73),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              color: Color.fromARGB(255, 244, 244, 252),
                            ),
                            child: Row(
                              children: [
                                ButtonSizeWidget(text: '15 см', number: 0, parentRef: ref),
                                ButtonSizeWidget(text: '30 см', number: 1, parentRef: ref),
                                ButtonSizeWidget(text: '45 см', number: 2, parentRef: ref),
                              ],
                            ),
                          ),
                        ),
                        const Text('Добавить к товару', style: TextStyle(fontSize: 14)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: loadIngredientsLeft(ref),
                            ),
                            Column(
                              children: loadIngredientsRight(ref),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text('С этим товаром покупают', style: TextStyle(fontSize: 14)),
                        ),
                        loadItemsList(ref),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> loadIngredientsLeft(WidgetRef ref) {
    List<Widget> widgetsList = [];
    DataModel loadDataWatch = ref.watch(loadDataProvider.select((value) => value));
    loadDataWatch.ingredientsForAdd?.forEach((item) {
      widgetsList.add(ItemAddLeftWidget(image: item.picture, text: '${item.title}'));
    });
    return widgetsList;
  }

  List<Widget> loadIngredientsRight(WidgetRef ref) {
    List<Widget> widgetsList = [];
    DataModel loadDataWatch = ref.watch(loadDataProvider.select((value) => value));
    loadDataWatch.ingredientsForAdd?.forEach((item) {
      widgetsList.add(ItemAddRightWidget(parentRef: ref, price: (item.price != null) ? item.price! : 0));
    });
    return widgetsList;
  }

  Widget loadItemsList(WidgetRef ref) {
    List<Row> rowsList = [];
    DataModel loadDataWatch = ref.watch(loadDataProvider.select((value) => value));

    bool isNewRow = true;
    List<Widget> rowChildren = [];
    loadDataWatch.relatedProducts?.forEach((item) {
      if (isNewRow) {
        rowChildren = [];
        rowChildren.add(ItemProductWidget(
          parentRef: ref,
          imageModel: item.picture,
          text: '${item.title}',
          subtext: '${item.weight} г  /  ${item.calorie} кКал',
        ));
        isNewRow = !isNewRow;
      } else {
        rowChildren.add(ItemProductWidget(
          parentRef: ref,
          imageModel: item.picture,
          text: '${item.title}',
          subtext: '${item.weight} г  /  ${item.calorie} кКал',
        ));
        rowsList.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rowChildren,
        ));
        isNewRow = !isNewRow;
      }
    });

    return Column(
      children: rowsList,
    );
  }
}
