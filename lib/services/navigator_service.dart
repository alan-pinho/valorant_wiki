import 'package:flutter/material.dart';

class NavigatorService<T> {
  final BuildContext context;
  NavigatorService.of(this.context);

  Future<T?> pushNamed(String routeName) async {
    if (!context.mounted) {
      return null;
    }
    return await Navigator.of(context).pushNamed(routeName) as T?;
  }
}
