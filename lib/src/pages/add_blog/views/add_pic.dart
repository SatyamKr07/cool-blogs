import 'package:cool_blog/src/controllers/add_blog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class AddPic extends StatelessWidget {
  AddPic({Key? key}) : super(key: key);
  final addBlogController = Get.find<AddBlogController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(10),
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () async {
                await addBlogController.pickBlogImageFromGallery();
              },
              icon: const Icon(
                Icons.photo_outlined,
                color: Colors.black,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () async {
                await addBlogController.clickBlogPhoto();
              },
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
