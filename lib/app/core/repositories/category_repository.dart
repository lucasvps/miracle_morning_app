import 'package:miracle_morning_app/app/core/custom_dio.dart';
import 'package:miracle_morning_app/app/core/endpoints.dart';
import 'package:miracle_morning_app/app/models/category_chosen_model.dart';
import 'package:miracle_morning_app/app/models/category_model.dart';

class CategoryRepository {

  List<dynamic> idsChosen = [];

  Future<List<CategoryModel>> getCategories() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CATEGORIES;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value){

      List<CategoryModel> categories = [];

      for(var item in value.data){
        CategoryModel model = CategoryModel.fromJson(item);
        if (!(idsChosen.contains(model.id)))
          categories.add(model);
      }

      return categories;

    }).catchError((err){
      return err;
    });
  }


  Future<List<CategoryChosenModel>> getCategoriesChosenActive() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CATEGORIES_CHOSEN;

    //print(url);

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value){

      idsChosen.clear();

      List<CategoryChosenModel> categories = [];

      for(var item in value.data){
        CategoryChosenModel model = CategoryChosenModel.fromJson(item);
        idsChosen.add(model.catId);
        categories.add(model);
      }

      print(idsChosen);
      return categories;

    }).catchError((err){
      return err;
    });
  }






}