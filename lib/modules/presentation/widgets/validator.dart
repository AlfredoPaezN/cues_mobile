import 'dart:developer';

import 'package:virtual_cues/modules/presentation/screens/auth/forgot_pass_screen.dart';
import 'package:virtual_cues/modules/presentation/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hot_toast/flutter_hot_toast.dart';

String? validateNotEmpty(String? value, BuildContext context, String field) {
  print('value: ${value.runtimeType}');

  if (value == null || value.isEmpty) {
    errorToast(context, '$field empty');
    return "This field can't be empty";
  }

  return null;
}

String? validatePassword(String? value, BuildContext context) {
  if (value == '' || value == null) {
    errorToast(context, 'Enter a password');
    return 'Please enter a password';
  }

  final missingRequirements = <String>[];

  // if (!upperCaseRegex.hasMatch(value)) {
  //   missingRequirements.add('at least one uppercase letter');
  // }

  // if (!lowerCaseRegex.hasMatch(value)) {
  //   missingRequirements.add('at least one lowercase letter');
  // }

  // if (!digitRegex.hasMatch(value)) {
  //   missingRequirements.add('at least one digit');
  // }

  // if (!lengthRegex.hasMatch(value)) {
  //   missingRequirements.add('at least 8 characters');
  // }

  if (missingRequirements.isNotEmpty) {
    errorToast(
      context,
      'Invalid password',
    );
    return 'Password must contain ${missingRequirements.join(', ')}';
  } else {
    return null; // La contraseña es válida
  }
}

String? validateEmail(String? value, BuildContext context) {
  final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  log('message: $value');
  if (value == null || value.isEmpty) {
    errorToast(context, 'Email empty');
    return 'Write a email';
  } else {
    if (!regex.hasMatch(value)) {
      errorToast(context, 'Invalid email');
      return 'Enter a valid email';
    } else {
      return null; // El correo electrónico es válido
    }
  }
}

String? validateLessThanZero(String value) {
  if (value != '') {
    if (int.parse(value) >= 0) {
      return null;
    }
    return 'minimum value: 0';
  }
  return "this field can't be empty";
}

String? validateYear(String value) {
  if (value != '') {
    if (int.parse(value) < 1989) {
      return 'Must be greater than 1989';
    }
    if (int.parse(value) > 2100) {
      return 'Must be less than 2100';
    }
  }
  return null;
}

String? matchPasswords({
  required TextEditingController passwordController,
  required value,
}) {
  if (passwordController.text != value) {
    return 'Password does not match!';
  }
  return null;
}

String? isValidEmail(String value) {
  return RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  ).hasMatch(value)
      ? null
      : 'Email is not valid';
}
