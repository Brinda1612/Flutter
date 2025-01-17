import 'package:flutter/material.dart';

import 'category_m.dart';

class Categorygriditem extends StatelessWidget {
  const Categorygriditem({super.key, required this.category, required this.onSelectedCategory});

  final Category category;
  final void Function() onSelectedCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectedCategory,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.5)
            ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            )
        ),
        child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer
            )
        ),
      ),
    );
  }
}
