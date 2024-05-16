import 'package:flutter/material.dart';
import 'package:flutter_hot_toast/flutter_hot_toast.dart';

void errorToast(BuildContext context, String message) {
  return context.loaderOverlay.show(
    widget: FlutterHotToast.error(
      context,
      height: 70,
      width: 800,
      label: Text(
        message,
        style: const TextStyle(
          fontSize: 30,
        ),
      ),
    ),
  );
}

void successToast(BuildContext context, String message) {
  return context.loaderOverlay.show(
    widget: FlutterHotToast.success(
      context,
      height: 70,
      width: 800,
      label: Text(
        message,
        style: const TextStyle(
          fontSize: 30,
        ),
      ),
    ),
  );
}

void loadingToast(BuildContext context, String message) {
  return context.loaderOverlay.show(
    widget: FlutterHotToast.loading(
      height: 70,
      width: 800,
      label: Text(
        message,
        style: const TextStyle(
          fontSize: 30,
        ),
      ),
    ),
  );
}
