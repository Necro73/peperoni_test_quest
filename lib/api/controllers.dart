import 'package:dio/dio.dart';
import 'package:peperoni_test_quest/api/models/data_model.dart';

class Controllers {

  Future<DataModel> loadData() async {
    var response = await Dio().get('https://html.xpager.ru/test.json');
    ///var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$nameOrId');
    return DataModel.parse(response.data);
  }

}