import 'package:flutter/material.dart';

navigateTo(BuildContext context, Widget routeWidget) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => routeWidget),
  );
}

navigateBack(BuildContext context) {
  Navigator.of(context).pop();
}

navigateAndReplace(BuildContext context, Widget routeWidget) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => routeWidget),
  );
}
