import 'package:finance_app/app/models/groups_model.dart';

class FinanceModel {
  double price;
  String title;
  List<GroupModel> groups;

  FinanceModel({
    required this.price,
    required this.title,
    required this.groups,
  });

Map<String, dynamic> toMap(){
  return{
    'price': price,
    'title': title,
    'groups': groups.map((GroupModel e)=>e.toMap()).toList(),
  };
  
}

factory FinanceModel.fromMap(map){
  return FinanceModel(
    price: map['price']?.toDouble() ?? 0.0,
    title: map['title'] ?? '',
    groups: List<GroupModel>.from(map['groups']?.map((e)=> GroupModel.fromMap(e))).toList()
  );
}

}




