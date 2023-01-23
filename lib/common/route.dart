import 'package:flutter/material.dart';
import 'package:test_provider/page/child_one_page.dart';
import 'package:test_provider/page/home_page.dart';

import '../page/child_two_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomePage.routeName: (context) => const HomePage(),
  ChildOnePage.routeName: (context) => const ChildOnePage(),
  ChildTwoPage.routeName: (context) => const ChildTwoPage(),
};
