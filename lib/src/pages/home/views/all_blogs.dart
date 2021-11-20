import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_blog/src/central/services/my_logger.dart';
import 'package:cool_blog/src/models/blog_model.dart';
import 'package:cool_blog/src/pages/home/views/blog_template.dart';
import 'package:flutter/material.dart';

class AllBlogs extends StatelessWidget {
  AllBlogs({Key? key}) : super(key: key);
  List<BlogModel> blogList = [];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("blogs").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
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
    );
  }
}
