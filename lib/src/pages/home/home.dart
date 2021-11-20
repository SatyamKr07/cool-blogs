import 'package:cool_blog/src/pages/add_blog/add_blog.dart';
import 'package:cool_blog/src/pages/home/views/all_blogs.dart';
import 'package:cool_blog/src/pages/home/views/category_filter_dropdown.dart';
import 'package:cool_blog/src/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cool Blog"),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => ProfilePage());
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/550x/7d/1a/3f/7d1a3f77eee9f34782c6f88e97a6c888.jpg"),
            ),
          )
        ],
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: const [
          CategoryFilterDropdown(),
          AllBlogs(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "ADDEXCHANGETAG",
        onPressed: () async {
          Get.to(() => AddBlog());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
