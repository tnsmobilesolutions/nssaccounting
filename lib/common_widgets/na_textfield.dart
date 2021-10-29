// import 'package:flutter/material.dart';

// class EditTextUtils {
//   TextFormField getCustomEditTextArea(
//       {String labelValue = "",
//       String hintValue = "",
//       Function validator?,
//       IconData icon,
//       bool validation,
//       TextEditingController controller,
//       TextInputType keyboardType = TextInputType.text,
//       String prefixText = '',
//       TextStyle textStyle,
//       bool autoFocus = false,
//       String validationErrorMsg,
//       BuildContext context}) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         prefixText: prefixText,
//         // prefixIcon: Icon(icon),
//         // prefixStyle: Theme.of(context).textTheme.bodyText1,
//         prefixStyle: textStyle,
//         fillColor: Colors.white.withOpacity(0.6),
//         // filled: true,
//         // isDense: true,
//         labelStyle: Theme.of(context).textTheme.overline,
//         focusColor: Colors.orange,
//         border: new OutlineInputBorder(
//           borderRadius: const BorderRadius.all(
//             const Radius.circular(8.0),
//           ),
//           borderSide: new BorderSide(
//             color: Colors.orange,
//             width: 1.0,
//           ),
//         ),
//         disabledBorder: new OutlineInputBorder(
//           borderRadius: const BorderRadius.all(
//             const Radius.circular(8.0),
//           ),
//           borderSide: new BorderSide(
//             color: Colors.orange,
//             width: 1.0,
//           ),
//         ),
//         focusedBorder: new OutlineInputBorder(
//           borderRadius: const BorderRadius.all(
//             const Radius.circular(8.0),
//           ),
//           borderSide: new BorderSide(
//             color: Colors.orange,
//             width: 1.0,
//           ),
//         ),
//         hintText: hintValue,
//         labelText: labelValue,
//       ),
//       validator: validator,
//       style: textStyle,
//       autofocus: autoFocus,
//     );
//   }
// }