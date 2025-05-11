import 'package:flutter/material.dart';

class Validators {
  static bool validateForm(GlobalKey<FormState> formKey) {
    return (formKey.currentState?.validate()) ?? false;
  }

  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required!";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required!";
    }

    const emailRegex = r"""^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"""; // simple regex

    if (!RegExp(emailRegex).hasMatch(value.trim())) {
      return "Please enter a valid email address!";
    }

    return null;
  }

  static String? passwordValidation(String? v) {
    if (v != null) {
      if (v.trim().isNotEmpty) {
        if (v.trim().length >= 6) {
          return null;
        } else {
          return "Password must be 6 characters long.";
        }
      }
    }
    return "Password is required!";
  }
}
