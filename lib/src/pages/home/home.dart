import 'package:cool_blog/src/pages/add_blog/add_blog.dart';
import 'package:cool_blog/src/pages/home/views/all_blogs.dart';
import 'package:cool_blog/src/pages/home/views/category_filter_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cool Blog")),
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
