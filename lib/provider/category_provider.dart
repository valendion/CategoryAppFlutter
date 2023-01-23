import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_provider/model/CategoryModel.dart';

class CategoryNotifier extends StateNotifier<List<CategoryModel>> {
  CategoryNotifier(List<CategoryModel> categories) : super(categories);

  void filterParent(int parent) {
    var parentList = state;

    parentList.retainWhere((element) {
      return element.parent == parent;
    });
    state = [...parentList];
  }

  void categoryParent(List<CategoryModel> categories) {
    state = [...categories];
  }

  // void addCategory(List<CategoryModel> categories) {
  //   pureCategories = categories;
  //   state = [...pureCategories];
  // }
}

final categoriesProvider =
    StateNotifierProvider<CategoryNotifier, List<CategoryModel>>((ref) {
  var categories = ref.watch(currentProvider);
  // debugPrint('Provider =>${categories.asData?.value}');
  return CategoryNotifier(categories);
});

final categoryConfigProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final String response = await rootBundle.loadString('assets/json/data.json');
  final List<dynamic> data = await json.decode(response);
  List<CategoryModel> categories =
      data.map((e) => CategoryModel.fromJson(e)).toList();
  return categories;
});

final pageProvider = StateProvider<int>((ref) {
  return 0;
});

final currentProvider = StateProvider<List<CategoryModel>>((ref) {
  var categories = ref.watch(categoryConfigProvider);
  return categories.asData?.value ?? [];
});
