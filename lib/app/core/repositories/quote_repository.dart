import 'package:miracle_morning_app/app/core/custom_dio.dart';
import 'package:miracle_morning_app/app/core/endpoints.dart';
import 'package:miracle_morning_app/app/models/quote_model.dart';

class QuoteRepository {


  Future<QuoteModel> randomQuote() async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.RANDOM_QUOTE;

    var dio = CustomDio.withAuthentication().instance;

    return await dio.get(url).then((value){
      print(value.data);
      QuoteModel quote = QuoteModel.fromJson(value.data);
      return quote;
    });
  }


}