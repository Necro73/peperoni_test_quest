class OfferModel {
  int? id;
  String? name;
  int? weight;
  int? calorie;
  int? price;

  static OfferModel parse(dynamic data) {
    var result = OfferModel();
    result.id = data['id'];
    result.name = data['name'];
    result.weight = data['weight'];
    result.calorie = data['calorie'];
    result.price = data['price'];
    return result;
  }
}
