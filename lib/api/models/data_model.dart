import 'package:peperoni_test_quest/api/models/image_model.dart';
import 'package:peperoni_test_quest/api/models/ingredient_and_related_product_model.dart';
import 'package:peperoni_test_quest/api/models/offer_model.dart';

class DataModel {
  int? calorie;
  List<String>? categories;
  String? description;
  int? id;
  int? sectionId;
  List<ImageModel>? imagesList;
  List<IngredientAndRelatedProductModel>? ingredientsForAdd;
  List<String>? ingredientsForDelete;
  bool? isOffer;
  String? measure;
  List<OfferModel>? offers;
  int? price;
  List<IngredientAndRelatedProductModel>? relatedProducts;
  String? title;
  int? weight;
  bool? inCart;
  bool? inFavorites;
  int? quantityInCart;
  int? idInCart;
  String? link;

  static DataModel parse(dynamic data) {
    DataModel result = DataModel();
    result.calorie = data['calorie'];
    List itemsList = data['categories'];
    result.categories = [];
    itemsList.forEach((item) {
      result.categories?.add(item.toString());
    });
    result.description = data['description'];
    result.id = data['id'];
    result.sectionId = data['section_id'];
    itemsList = data['imagesList'];
    result.imagesList = itemsList.map((m) => ImageModel.parse(m)).toList();
    itemsList = data['ingredientsForAdd'];
    result.ingredientsForAdd = itemsList.map((m) => IngredientAndRelatedProductModel.parse(m)).toList();
    result.ingredientsForDelete = [];
    itemsList.forEach((item) {
      result.ingredientsForDelete?.add(item.toString());
    });
    result.isOffer = data['isOffer'];
    result.measure = data['measure'];
    itemsList = data['offers'];
    result.offers = itemsList.map((m) => OfferModel.parse(m)).toList();
    result.price = data['price'];
    itemsList = data['relatedProducts'];
    result.relatedProducts = itemsList.map((m) => IngredientAndRelatedProductModel.parse(m)).toList();
    result.title = data['title'];
    result.weight = data['weight'];
    result.inCart = data['inCart'];
    result.inFavorites = data['inFavorites'];
    result.quantityInCart = data['quantityInCart'];
    result.idInCart = data['idInCart'];
    result.link = data['link'];
    return result;
  }
}
