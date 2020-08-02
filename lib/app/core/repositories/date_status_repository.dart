import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miracle_morning_app/app/core/custom_dio.dart';
import 'package:miracle_morning_app/app/core/endpoints.dart';
import 'package:miracle_morning_app/app/models/date_status_model.dart';
import 'package:intl/intl.dart';
import 'package:miracle_morning_app/app/modules/category_chosen/category_chosen_store.dart';
import 'package:miracle_morning_app/app/modules/chosen_details/chosen_details_store.dart';

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
      //Modular.to.pushNamedAndRemoveUntil('/home', ModalRoute.withName('/home'));
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

  Future<List<DateStatusModel>> dateStatusByChosen(chosenId) async {
    String url = ApiEndpoints.MAIN_URL +
        ApiEndpoints.DATE_STATUS_BY_CHOSEN +
        "$chosenId";

    print(url);

    var dio = CustomDio.withAuthentication().instance;

    Modular.get<ChosenDetailsStore>().totalDone = 0;
    Modular.get<ChosenDetailsStore>().totalLost = 0;

    return await dio.get(url).then((value) {
      List<DateStatusModel> list = [];

      for (var item in value.data) {
        DateStatusModel model = DateStatusModel.fromJson(item);
        list.add(model);

        if (model.status) {
          Modular.get<ChosenDetailsStore>().increaseTotalDone();
        } else {
          Modular.get<ChosenDetailsStore>().increaseTotalLost();
        }
      }

      return list;
    });
  }
}
