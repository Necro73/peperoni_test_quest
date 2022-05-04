class ImageModel {
  String? big;
  String? small;

  static ImageModel parse(dynamic data) {
    var result = ImageModel();
    result.big = data['big'];
    result.small = data['small'];
    return result;
  }
}
