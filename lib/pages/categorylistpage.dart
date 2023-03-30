// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:icarus/helpers/utils.dart';
import 'package:icarus/models/category.dart';
import 'package:icarus/services/categoryselectionservice.dart';
import 'package:icarus/services/categoryservice.dart';
import 'package:icarus/widgets/categorycard.dart';

class CategoryListPage extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {

    CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    CategoryService catService = Provider.of<CategoryService>(context, listen: false);
    List<Category> categories = catService.getCategories();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text('Select a category:',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black)
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext ctx, int index) {
              return CategoryCard(
                category: categories[index],
                onCardClick: () {
                  catSelection.selectedCategory = categories[index];
                  Utils.mainAppNav.currentState!.pushNamed('/selectedcategorypage');
                }
              );
            },
          ),
        )
      ]
    );
  }
}
