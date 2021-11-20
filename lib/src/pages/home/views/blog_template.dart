import 'package:cool_blog/src/central/widgets/build_swiper.dart';
import 'package:cool_blog/src/models/blog_model.dart';
import 'package:cool_blog/src/pages/home/views/blog_description.dart';
import 'package:flutter/material.dart';

class BlogTemplate extends StatelessWidget {
  BlogTemplate({Key? key, required this.blogModel}) : super(key: key);
  BlogModel blogModel = BlogModel(picList: []);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://bestprofilepictures.com/wp-content/uploads/2021/04/Cool-Profile-Picture.jpg"),
          ),
          title: Text(blogModel.title),
        ),
        BuildSwiper(picList: blogModel.picList),
        Text(blogModel.title),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlogDescription(blogModel: blogModel),
        ),
      ],
    );
  }
}
