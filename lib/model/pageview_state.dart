import 'package:flutter/material.dart';

enum Pages {
  toodo,
  newToodo,
}

class PageViewState extends ChangeNotifier {
  PageController pageController = PageController();

  int findPageIndex(Pages page) {
    return page.index + 1;
  }

  void navigateToAddNewTodoPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
  }

  void navigateToToodoPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
  }
}
