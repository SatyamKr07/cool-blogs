import 'package:cool_blog/src/central/services/user_controller.dart';
import 'package:cool_blog/src/controllers/home_controller.dart';
import 'package:cool_blog/src/pages/add_blog/add_blog.dart';
import 'package:cool_blog/src/pages/home/views/all_blogs.dart';
import 'package:cool_blog/src/pages/home/views/category_filter_dropdown.dart';
import 'package:cool_blog/src/pages/profile/profile_page.dart';
import 'package:cool_blog/src/pages/search_user/search_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final userController = Get.find<UserController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cool Blog"),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Get.to(() => const SearchUser());
              }),
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
          ),
        ],
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const CategoryFilterDropdown(),
          // GetBuilder<HomeController>(
          //   id: "FILTER_CATEGORY_DROPDOWN",
          //   builder: (_) => DropdownButton<String>(
          //     // value: _.blogModel.category,
          //     value: _.filterCategory,
          //     onChanged: _.filterPosts,
          //     items: const [
          //       DropdownMenuItem(
          //         value: "All Posts",
          //         child: Text('All Posts'),
          //       ),
          //       DropdownMenuItem(
          //         value: "sports",
          //         child: Text('Sports'),
          //       ),
          //       DropdownMenuItem(
          //         value: "movies",
          //         child: Text('Movies'),
          //       ),
          //     ],
          //   ),
          // ),

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
