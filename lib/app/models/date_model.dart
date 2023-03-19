import 'package:finance_app/app/models/groups_model.dart';

class DateModel {
  double price;
  String title;
  List<GroupModel> groups;

  DateModel({
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

factory DateModel.fromMap(map){
  return DateModel(
    price: map['price']?.toDouble() ?? 0.0,
    title: map['title'] ?? '',
    groups: List<GroupModel>.from(map['groups']?.map((e)=> GroupModel.fromMap(e))).toList()
  );
}

}




