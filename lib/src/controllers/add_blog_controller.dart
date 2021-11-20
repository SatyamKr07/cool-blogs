import 'package:cool_blog/src/central/services/image_service.dart';
import 'package:cool_blog/src/central/services/my_logger.dart';
import 'package:cool_blog/src/models/blog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';

class AddBlogController extends GetxController {
  BlogModel blogModel = BlogModel(picList: [], category: "*choose category");
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();

  final imageService = Get.find<ImageService>();
  List<XFile>? multiImages;
  Future pickBlogImageFromGallery() async {
    multiImages = await imageService.getImagesFromGallery();
    if (multiImages != null) {
      for (var element in multiImages!) {
        blogModel.picList.add(element.path);
      }
      logger.d('exchangeImages ${blogModel.picList}');
      update(['ADD_IMAGES_SWIPER']);
    }
  }

  Future clickBlogPhoto() async {
    var imageFile = await imageService.getPhotoFromCamera();
    if (imageFile != null) {
      blogModel.picList.add(imageFile.path);
      update(['ADD_IMAGES_SWIPER']);
    }
  }

  void selectCategory(String? category) {
    blogModel.category = category!;
    update(['CATEGORY_DROPDOWN']);
  }
}
