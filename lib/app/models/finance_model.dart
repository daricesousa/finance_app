import 'package:finance_app/app/models/groups_model.dart';

class FinanceModel {
  double entrada;
  String title;
  List<GroupModel> groups;

  FinanceModel({
    required this.entrada,
    required this.title,
    required this.groups,
  });

Map<String, dynamic> toMap(){
  return{
    'entrada': entrada,
    'title': title,
    'groups': groups.map((GroupModel e)=>e.toMap()).toList(),
  };
  
}

factory FinanceModel.fromMap(map){
  return FinanceModel(
    entrada: map['entrada']?.toDouble() ?? 0.0,
    title: map['title'] ?? '',
    groups: List<GroupModel>.from(map['groups']?.map((e)=> GroupModel.fromMap(e))).toList()
  );
}

}




