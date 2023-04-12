import 'package:flutter/material.dart';

Widget defultFormField({
  required TextEditingController controller,
  required TextInputType Type,
  Function? onSubmit,
  Function? onChanged,
  required Function validate,
  required String label,
  required var prefix,
  var suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: Type,
      onFieldSubmitted: (s) {
        onSubmit!();
      },
      onChanged: (s) {
        onChanged!();
      },
      validator: (s) {
        validate();
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: const OutlineInputBorder(),
      ),
    );
