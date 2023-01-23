import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_provider/common/widget/category_item.dart';
import 'package:test_provider/model/CategoryModel.dart';
import 'package:test_provider/provider/category_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  static String routeName = '/';
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var categories = ref.watch(currentProvider);
    debugPrint(categories.toString());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Intern Test'),
        ),
        body: Column(
          children: [
            Expanded(child: uiHome(categories)),
          ],
        ));
  }

  Widget uiHome(List<CategoryModel> categories) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: ((context, index) {
          return categoryItem(categories[index]);
        }));
  }
}
