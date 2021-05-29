// @dart=2.11

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// TODO refactor at least some of this - better to let API consumer pass parameters
// Can always write little wrapper widgets, like HandleInput, same effect but much cleaner
// and less likely to cause bugs
enum TextInputFieldType { text, email, handle, password, number }

///Text capitalization depends on type of field if the type is email or password not textcapitalization
///else it's TextCapitalization.sentences
class TextInputField extends StatelessWidget {
  final Key key;
  final bool enabled;
  final String title;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputFieldType type;
  final TextInputType keyboardType;
  final String value;
  final bool isValueInitial;
  final Widget suffixWidget;
  final FocusNode focusNode;
  final String errorText;
  final Function(String) validator;
  final Function(String) onChanged;
  final Function(String) onSaved;
  final int maxLines;
  final int maxLength;
  final Widget prefixIcon;
  final Widget prefix;
  final String prefixText;
  final bool isDense;
  final FloatingLabelBehavior floatingLabelBehavior;
  TextInputField(
    // TODO make title optional so that I don't have to pass null when I want to use hintText and labelText
    this.title, {
    this.key,
    this.hintText,
    this.labelText,
    this.type = TextInputFieldType.text, //refactor this to user keyboardType
    this.keyboardType, //currently if provided overide the keyboard type from type.
    this.enabled = true,
    this.isValueInitial = true,
    this.controller,
    this.value,
    this.errorText,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.suffixWidget,
    this.focusNode,
    this.prefixIcon,
    this.maxLines = 1,
    this.prefix,
    this.prefixText,
    this.maxLength,
    this.floatingLabelBehavior,
    this.isDense = false,
    helpText,
  });

  Widget _buildFormField(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      enabled: enabled ?? true,
      obscureText: type == TextInputFieldType.password ? true : false,
      controller: controller,
      keyboardType: keyboardType ??
          (type == TextInputFieldType.email
              ? TextInputType.emailAddress
              : TextInputType.text),
      textCapitalization: (type == TextInputFieldType.email ||
              type == TextInputFieldType.password ||
              type == TextInputFieldType.handle)
          ? TextCapitalization.none
          : TextCapitalization.sentences,
      initialValue: isValueInitial ? this.value : "",
      autofocus: false,
      maxLines: this.maxLines,
      maxLength: this.maxLength,
      decoration: InputDecoration(
        isDense: isDense,
        hintText: this.hintText ?? this.title,
        labelText: this.labelText ?? this.title,
        suffixIcon: suffixWidget,
        errorText: errorText,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        prefix: prefix,
        floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.auto,

//        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//          border: OutlineInputBorder(
//            borderRadius: BorderRadius.zero,
//            borderSide: BorderSide.none,
//          ),
      ),
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFormField(context);
  }
}

class TextAreaInputField extends StatelessWidget {
  final Key key;
  final String title;
  final String hintText;
  final String labelText;
  final int maxLines;
  final int maxLength;
  final String value;
  final bool capitalize;
  final Function(String) validator;
  final Function(String) onChanged;
  final Function(String) onSaved;
  const TextAreaInputField(
    this.title, {
    this.key,
    this.hintText,
    this.labelText,
    this.maxLines,
    this.maxLength,
    this.capitalize = false,
    this.value,
    this.validator,
    this.onChanged,
    this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // inputFormatters: [
      //   UpperCaseTextFormatter(),
      // ],
      // minLines: 1,
      maxLines: this.maxLines,
      maxLength: this.maxLength,
      maxLengthEnforced: false,
      keyboardType: TextInputType.multiline,
      cursorColor: Theme.of(context).cursorColor,
      textCapitalization: TextCapitalization.sentences,
      autofocus: false,
      initialValue: value,
      decoration: InputDecoration(
        hintText: this.hintText ?? this.title,
        labelText: this.labelText ?? this.title,
      ),
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
