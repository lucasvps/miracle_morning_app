class DateStatusModel {
  int categoryChosenId;
  String date;
  bool status;

  DateStatusModel({this.categoryChosenId, this.date, this.status});

  DateStatusModel.fromJson(Map<String, dynamic> json) {
    categoryChosenId = json['chosenId'];
    date = json['date'];
    json['status'] == 1 ? status = true : status = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_chosen_id'] = this.categoryChosenId;
    data['date'] = this.date;
    data['status'] = this.status;

    return data;
  }
}
