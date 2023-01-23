import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_provider/model/CategoryModel.dart';
import 'package:test_provider/page/child_one_page.dart';
import 'package:test_provider/page/child_two_page.dart';

import '../../provider/category_provider.dart';

Widget categoryItem(CategoryModel categoryModel) {
  return Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return SizedBox(
          width: double.infinity,
          child: Card(
            child: InkWell(
              onTap: () {
                ref
                    .watch(categoriesProvider.notifier)
                    .categoryParent(ref.watch(currentProvider));
                ref
                    .read(categoriesProvider.notifier)
                    .filterParent(categoryModel.id);

                var page = ref.read(pageProvider);
                if (page == 0) {
                  if (ref.read(pageProvider) < 3) {
                    ref.read(pageProvider.notifier).state++;
                  }
                  Navigator.pushNamed(context, ChildOnePage.routeName);
                } else if (page == 1) {
                  if (ref.read(pageProvider) < 3) {
                    ref.read(pageProvider.notifier).state++;
                  }
                  Navigator.pushNamed(context, ChildTwoPage.routeName);
                } else {
                  const snackBar = SnackBar(
                    content: Text('Last Screen'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Id : ${categoryModel.id}'),
                        Text('Name : ${categoryModel.name}')
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Slug : ${categoryModel.slug}'),
                        Text('Parent : ${categoryModel.parent}')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
    },
  );
}
