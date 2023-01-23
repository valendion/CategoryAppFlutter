import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_provider/model/CategoryModel.dart';
import 'package:test_provider/provider/category_provider.dart';

import '../common/widget/category_item.dart';

class ChildOnePage extends ConsumerWidget {
  static String routeName = '/childOne';
  const ChildOnePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stateChildOne = ref.read(categoriesProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Intern Test'),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
                ref.read(pageProvider.notifier).state--;
                debugPrint('Page =>${ref.read(pageProvider)}');
              }),
        ),
        body: Column(children: [
          Expanded(
            child: _uiOne(stateChildOne),
          ),
        ]));
  }

  Widget _uiOne(List<CategoryModel> stateChildOne) {
    debugPrint('Page =>${stateChildOne.isEmpty}');
    if (stateChildOne.isEmpty) {
      return Center(child: Text('Data Empty'));
    }
    return ListView.builder(
        itemCount: stateChildOne.length,
        itemBuilder: ((context, index) {
          return categoryItem(stateChildOne[index]);
        }));
  }
}
