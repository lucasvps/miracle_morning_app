import 'package:date_format/date_format.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miracle_morning_app/app/core/custom_dio.dart';
import 'package:miracle_morning_app/app/core/endpoints.dart';
import 'package:miracle_morning_app/app/models/date_status_model.dart';
import 'package:intl/intl.dart';
import 'package:miracle_morning_app/app/modules/category_chosen/category_chosen_store.dart';

class DateStatusRepository {
  var today = formatDate(
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()),
      [yyyy, '-', mm, '-', dd]).toString();

  Future markDateStatus(DateStatusModel dateStatusModel) async {
    String url = ApiEndpoints.MAIN_URL + ApiEndpoints.MARK_STATUS;

    var dio = CustomDio.withAuthentication().instance;

    print(dateStatusModel.toJson());

    return await dio.post(url, data: dateStatusModel.toJson()).then((value) {
      print(value.data);
      Modular.to.pushNamed('/home');
    }).catchError((err) {
      print(err);
      return err;
    });
  }

  Future ifTodayAlreadyMarked() async {
    String url =
        ApiEndpoints.MAIN_URL + ApiEndpoints.CONFIRM_TODAY_ALREADY_MARKED;

    var dio = CustomDio.withAuthentication().instance;

    Modular.get<CategoryChosenStore>().idDoneToday.clear();

    return await dio.get(url).then((value) {
      //print(value.data);
      for (var item in value.data) {
        DateStatusModel model = DateStatusModel.fromJson(item);

        if (model.date == today) {
          Modular.get<CategoryChosenStore>()
              .idDoneToday
              .add(model.categoryChosenId);
        }
      }
      //print(Modular.get<CategoryChosenStore>().idDoneToday);
    });
  }
}
