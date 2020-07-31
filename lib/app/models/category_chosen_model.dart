class CategoryChosenModel {
  int amountDone;
  int amountDays;
  String name;
  int id;
  String beginDate;
  String endDate;
  String description;
  String image;
  int catId;
  bool todayStatus;

  CategoryChosenModel(
      {this.amountDone,
      this.amountDays,
      this.name,
      this.id,
      this.beginDate,
      this.endDate,
      this.description,
      this.image, this.catId, this.todayStatus});

  CategoryChosenModel.fromJson(Map<String, dynamic> json) {
    amountDone = json['amountDone'];
    amountDays = json['amountDays'];
    name = json['name'];
    id = json['id'];
    beginDate = json['begin_date'];
    endDate = json['end_date'];
    description = json['description'];
    image = json['image'];
    catId = json['cat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amountDone'] = this.amountDone;
    data['amountDays'] = this.amountDays;
    data['name'] = this.name;
    data['id'] = this.id;
    data['begin_date'] = this.beginDate;
    data['end_date'] = this.endDate;
    data['description'] = this.description;
    data['image'] = this.image;
    data['cat_id'] = this.catId;
    return data;
  }
}