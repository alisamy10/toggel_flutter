import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final Function onSubmit;
  final Function onChange;
  final Function onTap;

  final bool isPassword;

  final Function validate;
  final String label;
  final IconData prefix;
  final IconData suffix;
  final Function suffixPressed;
  final bool isClickable;

 const DefaultFormField(
      {this.controller,
      this.type,
      this.onSubmit,
      this.onChange,
      this.onTap,
      this.isPassword = false,
      this.validate,
      this.label,
      this.prefix,
      this.suffix,
      this.suffixPressed,
      this.isClickable = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
  }
}
