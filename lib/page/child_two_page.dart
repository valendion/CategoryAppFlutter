import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_provider/model/CategoryModel.dart';
import 'package:test_provider/provider/category_provider.dart';

import '../common/widget/category_item.dart';

class ChildTwoPage extends ConsumerWidget {
  static String routeName = '/childTwo';
  const ChildTwoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stateChilTwo = ref.read(categoriesProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Intern Test'),
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
            child: _uiTwo(stateChilTwo),
          ),
        ]));
  }

  Widget _uiTwo(List<CategoryModel> stateChilTwo) {
    if (stateChilTwo.isEmpty) {
      return const Center(child: Text('Data Empty'));
    }
    return ListView.builder(
        itemCount: stateChilTwo.length,
        itemBuilder: ((context, index) {
          return categoryItem(stateChilTwo[index]);
        }));
  }
}
