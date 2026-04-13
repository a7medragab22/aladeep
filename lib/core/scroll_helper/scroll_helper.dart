import 'package:flutter/material.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';

class HomeScrollProvider extends InheritedWidget {
  final ScrollController scrollController;
  final GlobalKey commentsKey;
  final GlobalKey whyUsKey;

  const HomeScrollProvider({
    super.key,
    required this.scrollController,
    required this.commentsKey,
    required this.whyUsKey,
    required super.child,
  });

  static HomeScrollProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeScrollProvider>();
  }

  void scrollToComments() {
    _scrollToWidget(commentsKey);
  }

  void scrollToWhyUs() {
    _scrollToWidget(whyUsKey);
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToWidget(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  bool updateShouldNotify(HomeScrollProvider oldWidget) =>
      scrollController != oldWidget.scrollController ||
      commentsKey != oldWidget.commentsKey ||
      whyUsKey != oldWidget.whyUsKey;
}

mixin HomeScrollMixin {
  final ScrollController scrollController = ScrollController();

  // مفاتيح السكاشن اللي مش في آخر الصفحة
  final GlobalKey commentsKey = GlobalKey();
  final GlobalKey whyUsKey = GlobalKey();

  void handleScroll(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is! Map<String, dynamic>) return;

      if (args['scrollToFooter'] == true) {
        animateTo(scrollController.position.maxScrollExtent);
      } else if (args['scrollToComments'] == true) {
        scrollToWidget(commentsKey);
      } else if (args['scrollToWhyUs'] == true) {
        scrollToWidget(whyUsKey);
      }
    });
  }

  void scrollToWidget(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void animateTo(double offset) {
    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void disposeScroll() {
    scrollController.dispose();
  }
}
