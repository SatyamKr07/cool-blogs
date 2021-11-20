import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_blog/src/central/services/firebase_services.dart';
import 'package:cool_blog/src/central/services/image_service.dart';
import 'package:cool_blog/src/central/services/my_logger.dart';
import 'package:cool_blog/src/models/blog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';

class AddBlogController extends GetxController {
  BlogModel blogModel = BlogModel(picList: [], category: "*choose category");
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();

  final imageService = Get.find<ImageService>();
  final firebaseServices = Get.find<FirebaseStorageService>();
  bool isUploading = false;

  final CollectionReference _mainCollection =
      FirebaseFirestore.instance.collection('blogs');

  List<XFile>? multiImages = [];
  List<String> imagesPath = [];
  Future pickBlogImageFromGallery() async {
    multiImages = (await imageService.getImagesFromGallery());
    // multiImages!.addAll(await imageService.getImagesFromGallery());
    if (multiImages != null) {
      for (var element in multiImages!) {
        imagesPath.add(element.path);
        // blogModel.picList.add(element.path);
      }
      logger.d('exchangeImages ${blogModel.picList}');
      update(['ADD_IMAGES_SWIPER']);
    }
  }

  Future clickBlogPhoto() async {
    multiImages!.last = (await imageService.getPhotoFromCamera());
    if (multiImages != null) {
      imagesPath.add(multiImages!.last.path);
      update(['ADD_IMAGES_SWIPER']);
    }
  }

  void selectCategory(String? category) {
    blogModel.category = category!;
    update(['CATEGORY_DROPDOWN']);
  }

  Future uploadImages() async {
    try {
      await firebaseServices.uploadImageToFirebaseStorage(
        imagesPath: imagesPath,
        imagesUrlToStore: blogModel.picList,
      );
    } catch (e) {
      logger.e('error in uploading images $e');
    } finally {}
  }

  Future postBlog() async {
    update(['ADD_BLOG_PAGE']);
    feedBlogData();
    if (!validateData()) {
      Get.snackbar("Opps!", "All *marked fields are compusory");
      return;
    }
    isUploading = true;
    try {
      await uploadImages();
      _mainCollection
          .add(blogModel.toJson())
          .then((docRef) {})
          .catchError((error) {});
    } catch (e) {
      logger.e(e);
      isUploading = false;
      update(['ADD_BLOG_PAGE']);
    } finally {
      blogModel = BlogModel(picList: [], category: "*choose category");
      isUploading = false;
      // update(['ADD_BLOG_PAGE']);
      Get.back();
      Get.back();
    }
  }

  feedBlogData() {
    blogModel.title = titleCtrl.text;
    blogModel.description = descCtrl.text;
  }

  validateData() {
    if (blogModel.title == "" ||
        blogModel.description == "" ||
        imagesPath.isEmpty ||
        blogModel.category == "*choose category") {
      return false;
    }
    return true;
  }
}
