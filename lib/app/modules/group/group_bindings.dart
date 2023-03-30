import 'package:finance_app/app/modules/group/group_controller.dart';
import 'package:get/get.dart';

class GroupBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(GroupController());
  }
}
