import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_blog/src/central/services/my_logger.dart';
import 'package:cool_blog/src/controllers/home_controller.dart';
import 'package:cool_blog/src/models/blog_model.dart';
import 'package:cool_blog/src/pages/home/views/blog_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';

class AllBlogs extends StatelessWidget {
  AllBlogs({Key? key}) : super(key: key);
  List<BlogModel> blogList = [];
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'ALL_POSTS',
      builder: (_) => StreamBuilder<QuerySnapshot>(
        // stream: FirebaseFirestore.instance
        //     .collection('blogs')
        //     .where('category', isEqualTo: homeController.filterCategory)
        //     .snapshots(),
        stream: homeController.filterPosts(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Something went wrong'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Loading..."),
            );
          }
          blogList = snapshot.data!.docs.map((DocumentSnapshot document) {
            return BlogModel.fromJson(document.data() as Map<String, dynamic>);
          }).toList();
          logger.d("blogList", blogList.length.toString());

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              // snapshot.data!.docs.map((DocumentSnapshot document) {
              // BlogModel blogModel =
              // BlogModel.fromJson(document.data() as Map<String, dynamic>);
              // });
              BlogModel blogModel = blogList[index];
              return BlogTemplate(blogModel: blogModel);
            },
          );

          // ListView(
          //   physics: const ClampingScrollPhysics(),
          //   shrinkWrap: true,
          //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
          //     BlogModel blogModel =
          //         BlogModel.fromJson(document.data() as Map<String, dynamic>);
          //     return BlogTemplate(blogModel: blogModel);
          //   }).toList(),
          // );
        },
      ),
    );
  }
}
