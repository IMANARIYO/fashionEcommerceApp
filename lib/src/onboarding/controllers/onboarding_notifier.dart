import 'package:flutter/material.dart';

class OnboardingNotifier with ChangeNotifier {
  int _selectedPage = 0;
  int get selectedPage => _selectedPage;
  set selectedPage(int page) {
    _selectedPage = page;
// print("The page is_____________ $page");
    notifyListeners();
  }
}
