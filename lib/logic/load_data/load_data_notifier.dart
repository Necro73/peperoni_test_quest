import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peperoni_test_quest/api/controllers.dart';
import 'package:peperoni_test_quest/api/models/data_model.dart';

final loadDataProvider = StateNotifierProvider<LoadDataNotifier, DataModel>((ref) {
  return LoadDataNotifier();
});

class LoadDataNotifier extends StateNotifier<DataModel> {
  LoadDataNotifier(): super(DataModel()) {
    loadData();
  }

  void loadData() async {
    DataModel dataModel;
    try {
      dataModel = await Controllers().loadData();
    }
    catch (error) {
      dataModel = DataModel();
    }
    state = dataModel;
  }
}