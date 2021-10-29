import 'package:flutter/material.dart';

class CommonStyle {
  static InputDecoration textFieldStyle(
      {String labelTextStr = "", String hintTextStr = ""}) {
    return InputDecoration(
      // prefixText: prefixText,
      // prefixIcon: Icon(icon),
      // prefixStyle: Theme.of(context).textTheme.bodyText1,
      // prefixStyle: textStyle,
      fillColor: Colors.white.withOpacity(0.6),
      // filled: true,
      // isDense: true,
      // labelStyle: Theme.of(context).textTheme.overline,
      focusColor: Colors.orange,

      border: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(8.0),
        ),
        borderSide: new BorderSide(
          color: Colors.orange,
          width: 1.0,
        ),
      ),
      disabledBorder: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(8.0),
        ),
        borderSide: new BorderSide(
          color: Colors.orange,
          width: 1.0,
        ),
      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(8.0),
        ),
        borderSide: new BorderSide(
          color: Colors.orange,
          width: 1.0,
        ),
      ),
      hintText: hintTextStr,
      hintStyle: TextStyle(color: Colors.black),
      labelText: labelTextStr,
    );
  }
}
