class ProductModel {
  String assetName = '';
  String text = '';
  String subtext = '';

  static ProductModel parse(dynamic data) {
    var result = ProductModel();
    result.assetName = data['id'];
    result.text = data['title'];
    result.subtext = data['measure'];
    return result;
  }
}
