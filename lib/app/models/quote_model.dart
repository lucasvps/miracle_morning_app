class QuoteModel {
  int id;
  String quote;
  String author;

  QuoteModel({this.id, this.quote, this.author});

  QuoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quote = json['quote'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quote'] = this.quote;
    data['author'] = this.author;
    return data;
  }
}