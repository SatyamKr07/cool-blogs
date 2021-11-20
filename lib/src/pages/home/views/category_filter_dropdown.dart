import 'package:cool_blog/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoryFilterDropdown extends StatelessWidget {
  const CategoryFilterDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GetBuilder<HomeController>(
        id: "CATEGORY_DROPDOWN",
        builder: (_) => DropdownButton<String>(
          // value: _.blogModel.category,
          value: "All Posts",
          // onChanged: _.selectCategory,
          items: const [
            DropdownMenuItem(
              value: "All Posts",
              child: Text('Choose Category'),
            ),
            DropdownMenuItem(
              value: "sports",
              child: Text('Sports'),
            ),
            DropdownMenuItem(
              value: "movies",
              child: Text('Movies'),
            ),
          ],
        ),
      ),
    );
  }
}
