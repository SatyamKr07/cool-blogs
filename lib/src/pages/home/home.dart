import 'package:cool_blog/src/central/services/user_controller.dart';
import 'package:cool_blog/src/pages/add_blog/add_blog.dart';
import 'package:cool_blog/src/pages/home/views/all_blogs.dart';
import 'package:cool_blog/src/pages/home/views/category_filter_dropdown.dart';
import 'package:cool_blog/src/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final userController = Get.find<UserController>();

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
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      userController.appUser.profilePic.toString())),
            ),
          )
        ],
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const CategoryFilterDropdown(),
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
