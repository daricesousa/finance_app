class ExpenseModel {
  double price;
  String title;

  ExpenseModel({
    required this.price,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      "price": price,
      "title": title,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      price: map["price"],
      title: map["title"],
    );
  }
}
