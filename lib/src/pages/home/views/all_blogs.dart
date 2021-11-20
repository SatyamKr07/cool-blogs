import 'package:cool_blog/src/models/blog_model.dart';
import 'package:cool_blog/src/pages/home/views/blog_template.dart';
import 'package:flutter/material.dart';

class AllBlogs extends StatelessWidget {
  const AllBlogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          BlogModel blogModel = BlogModel(
              title: "My first blog",
              description:
                  "A blog (a truncation of webpage is a discussion or informational website published on the World Wide Web consisting of discrete, often informal diary-style text entries (posts). Posts are typically displayed in reverse chronological order, so that the most recent post appears first, at the top of the web page.",
              picList: [
                "https://bestprofilepictures.com/wp-content/uploads/2021/04/Cool-Profile-Picture.jpg",
                "https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW5zdGFncmFtJTIwcHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"
              ]);
          return BlogTemplate(blogModel: blogModel);
        });
  }
}
