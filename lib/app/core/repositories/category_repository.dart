import 'package:date_format/date_format.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miracle_morning_app/app/core/custom_dio.dart';
import 'package:miracle_morning_app/app/core/endpoints.dart';
import 'package:miracle_morning_app/app/models/category_chosen_model.dart';
import 'package:miracle_morning_app/app/models/category_model.dart';
import 'package:intl/intl.dart';
import 'package:miracle_morning_app/app/modules/home/home_store.dart';

class CategoryRepository {
  var today = formatDate(
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()),
      [yyyy, '-', mm, '-', dd]).toString();

  var finalDate = formatDate(
      DateFormat("yyyy-MM-dd").parse(DateTime.now().add(Duration(days: 30)).toString()),
      [yyyy, '-', mm, '-', dd]).toString();

  List<dynamic> idsChosen = [];

  Future<List<CategoryModel>> getCategories() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CATEGORIES;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      List<CategoryModel> categories = [];

      for (var item in value.data) {
        CategoryModel model = CategoryModel.fromJson(item);
        if (!(idsChosen.contains(model.id))) categories.add(model);
      }

      return categories;
    }).catchError((err) {
      return err;
    });
  }

  Future<List<CategoryChosenModel>> getCategoriesChosenActive() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CATEGORIES_CHOSEN;

    //print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value) {
      idsChosen.clear();

      List<CategoryChosenModel> categories = [];

      for (var item in value.data) {
        CategoryChosenModel model = CategoryChosenModel.fromJson(item);
        idsChosen.add(model.catId);
        categories.add(model);
      }

      //print(idsChosen);
      return categories;
    }).catchError((err) {
      return err;
    });
  }

  Future chooseCategory(catId) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CHOOSE_CATEGORY;

    Map<String, dynamic> model = Map<String, dynamic>();
    model['begin_date'] =  today;
    model['end_date'] = finalDate;
    model['category_id'] = catId;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.post(url, data: model).then((value) {
      Modular.get<HomeStore>().currentIndex = 0;
      Modular.to.pushNamed('/home');
    }).catchError((err) {
      return err;
    });
  }
}
