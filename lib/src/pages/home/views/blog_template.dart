import 'package:cool_blog/src/central/services/user_controller.dart';
import 'package:cool_blog/src/central/widgets/build_swiper.dart';
import 'package:cool_blog/src/controllers/home_controller.dart';
import 'package:cool_blog/src/models/blog_model.dart';
import 'package:cool_blog/src/models/user_model.dart';
import 'package:cool_blog/src/pages/home/views/blog_description.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class BlogTemplate extends StatelessWidget {
  BlogTemplate({Key? key, required this.blogModel}) : super(key: key);
  BlogModel blogModel;
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(blogModel.postedBy.profilePic),
          ),
          title: Text(blogModel.postedBy.displayName),
        ),
        BuildSwiper(picList: blogModel.picList),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Wrap(children: [
            Text(blogModel.title),
            InkWell(
              onTap: () {
                homeController.changeFilter(blogModel.category);
              },
              child: Text(
                " #${blogModel.category}",
                style: const TextStyle(color: Colors.blue),
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlogDescription(blogModel: blogModel),
        ),
      ],
    );
  }
}
