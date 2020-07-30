import 'package:miracle_morning_app/app/core/custom_dio.dart';
import 'package:miracle_morning_app/app/core/endpoints.dart';
import 'package:miracle_morning_app/app/models/category_model.dart';

class CategoryRepository {

  Future<List<CategoryModel>> getCategories() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.CATEGORIES;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value){

      List<CategoryModel> categories = [];

      for(var item in value.data){
        CategoryModel model = CategoryModel.fromJson(item);
        categories.add(model);
      }

      return categories;

    }).catchError((err){
      return err;
    });
  }






}