import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigatorKey;
  static NavigationService instance = NavigationService();
  NavigationService() {
    navigatorKey = GlobalKey<NavigatorState>();
  }
  navigate(Widget screen) {
    navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => screen));
  }

  goback() {
    return navigatorKey.currentState!.pop();
  }

  showLoader() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        },
      );
    });
  }
}
