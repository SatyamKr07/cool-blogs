import 'package:cool_blog/src/central/services/image_service.dart';
import 'package:cool_blog/src/central/services/user_controller.dart';
import 'package:cool_blog/src/controllers/add_blog_controller.dart';
import 'package:cool_blog/src/controllers/home_controller.dart';
import 'package:get/instance_manager.dart';

import 'firebase_services.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBlogController>(() => AddBlogController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ImageService>(() => ImageService(), fenix: true);
    Get.lazyPut<FirebaseStorageService>(() => FirebaseStorageService(),
        fenix: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
  }
}
