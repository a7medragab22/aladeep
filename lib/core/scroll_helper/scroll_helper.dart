import 'package:flutter/material.dart';

mixin HomeScrollMixin {
  final ScrollController scrollController = ScrollController();

  // مفاتيح السكاشن اللي مش في آخر الصفحة
  final GlobalKey commentsKey = GlobalKey();
  final GlobalKey whyUsKey = GlobalKey();

  void handleScroll(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args == null) return;

      if (args['scrollToFooter'] == true) {
        _animateTo(scrollController.position.maxScrollExtent);
      } else if (args['scrollToComments'] == true) {
        _scrollToWidget(commentsKey);
      } else if (args['scrollToWhyUs'] == true) {
        _scrollToWidget(whyUsKey);
      }
    });
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

  void _animateTo(double offset) {
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
