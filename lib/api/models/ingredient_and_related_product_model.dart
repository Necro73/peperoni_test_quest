import 'package:peperoni_test_quest/api/models/image_model.dart';

class IngredientAndRelatedProductModel {
  int? id;
  int? sectionId;
  String? title;
  List<String>? categories;
  int? price;
  bool? isOffer;
  bool? hasVariants;
  bool? inCart;
  bool? inFavorites;
  int? quantityInCart;
  int? idInCart;
  ImageModel? picture;
  int? calorie;
  int? weight;

  static IngredientAndRelatedProductModel parse(dynamic data) {
    var result = IngredientAndRelatedProductModel();
    result.id = data['id'];
    result.sectionId = data['section_id'];
    result.title = data['title'];
    List itemsList = data['categories'];
    result.categories = [];
    itemsList.forEach((item) {
      result.categories?.add(item.toString());
    });
    result.price = data['price'];
    result.isOffer = data['isOffer'];
    result.hasVariants = data['hasVariants'];
    result.inCart = data['inCart'];
    result.inFavorites = data['inFavorites'];
    result.quantityInCart = data['quantityInCart'];
    result.idInCart = data['idInCart'];
    result.picture = (data['picture'] != null) ? ImageModel.parse(data['picture']) : null;
    result.calorie = data['calorie'];
    result.weight = data['weight'];
    return result;
  }
}
