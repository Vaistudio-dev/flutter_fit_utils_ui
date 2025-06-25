import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Wrapper for [TextFormField].
/// Uses bodyMedium to set the style of the value.
class FitTextInput extends StatelessWidget {
  static const int _defaultMaxLength = 255;

  /// Field label.
  final String label;

  /// Field hint.
  final String hint;

  /// Editing controller.
  final TextEditingController? controller;

  /// [true] if the field should be focused when building. [false] by default.
  final bool autofocus;

  /// Set to [true] if the value of the field should be hidden.
  /// Ex: for a password.
  final bool hideValue;

  /// Set to [true] to mark a field as required.
  /// A required field has an * next to it's label.
  final bool markAsRequired;

  /// Validation mode.
  final AutovalidateMode validationMode;

  /// Input action when the field is submitted.
  final TextInputAction? inputAction;

  /// Formatters.
  final List<TextInputFormatter>? formatters;

  /// Keyboard type.
  /// Note: on iOS, the number keyboard doesn't have a submit button.
  final TextInputType keyboardType;

  /// Capitalization of the field value.
  final TextCapitalization capitalization;

  /// Suffix of the field, aligned to the right of the value.
  final Widget? suffix;

  /// Execute to validate the field's value.
  final String? Function(String?)? validation;

  /// Execute when the field has been submited.
  final Function(String)? onFieldSubmitted;

  /// Execute when the value of the field is changing.
  final Function(String)? onChange;

  /// Focus node.
  final FocusNode? focusNode;

  /// Margin of the field.
  final EdgeInsets? margin;

  /// Padding of the field.
  final EdgeInsets? padding;

  /// Minimum lines of text.
  final int? minLines;

  /// Maximum amount of lines allowed.
  final int? maxLines;

  /// Maximum allowed length of value.
  /// 255 by default.
  final int maxLength;

  /// Set to [true] if you want the field to take the available height.
  final bool expand;

  /// Width of the field, in pixels.
  final double? width;

  /// Height of the field, in pixels.
  final double? height;

  /// Set to [true] if the field's value should be read only.
  final bool? readonly;

  /// Creates a new [FitTextInput].
  const FitTextInput({
    super.key,
    this.controller,
    this.autofocus = false,
    this.inputAction,
    this.maxLength = _defaultMaxLength,
    required this.label,
    this.markAsRequired = false,
    this.hint = "",
    this.hideValue = false,
    this.suffix,
    this.focusNode,
    this.validationMode = AutovalidateMode.disabled,
    this.keyboardType = TextInputType.text,
    this.capitalization = TextCapitalization.none,
    this.formatters,
    this.validation,
    this.onFieldSubmitted,
    this.onChange,
    this.margin,
    this.padding,
    this.maxLines = 1,
    this.minLines,
    this.expand = false,
    this.width,
    this.height,
    this.readonly,
  });

  /// Creates a new [FitTextInput], with presets to use allow multiple lines.
  const FitTextInput.multiline({
    super.key,
    this.controller,
    this.autofocus = false,
    this.maxLength = 255,
    this.inputAction,
    required this.label,
    this.markAsRequired = false,
    this.hint = "",
    this.hideValue = false,
    this.suffix,
    this.focusNode,
    this.validationMode = AutovalidateMode.disabled,
    this.keyboardType = TextInputType.multiline,
    this.capitalization = TextCapitalization.sentences,
    this.formatters,
    this.validation,
    this.onFieldSubmitted,
    this.onChange,
    this.margin,
    this.padding,
    this.maxLines,
    this.minLines,
    this.expand = true,
    this.width,
    this.height = 200,
    this.readonly,
  });

  /// Copies an instance and override properties.
  FitTextInput copyWith({
    String? label,
    TextEditingController? controller,
    bool? autofocus,
    TextInputAction? inputAction,
    bool? markAsRequired,
    String? hint,
    bool? hideValue,
    Widget? suffix,
    FocusNode? focusNode,
    AutovalidateMode? validationMode,
    TextInputType? keyboardType,
    TextCapitalization? capitalization,
    List<TextInputFormatter>? formatters,
    String? Function(String?)? validation,
    dynamic Function(String)? onFieldSubmitted,
    dynamic Function(String)? onChange,
    EdgeInsets? margin,
    EdgeInsets? padding,
    int? maxLines,
    int? minLines,
    bool? expand,
    double? width,
    double? height,
    bool? readonly,
  }) =>
      FitTextInput(
        label: label ?? this.label,
        controller: controller ?? this.controller,
        autofocus: autofocus ?? this.autofocus,
        inputAction: inputAction ?? this.inputAction,
        markAsRequired: markAsRequired ?? this.markAsRequired,
        hint: hint ?? this.hint,
        hideValue: hideValue ?? this.hideValue,
        suffix: suffix ?? this.suffix,
        focusNode: focusNode ?? this.focusNode,
        validationMode: validationMode ?? this.validationMode,
        keyboardType: keyboardType ?? this.keyboardType,
        capitalization: capitalization ?? this.capitalization,
        formatters: formatters ?? this.formatters,
        validation: validation ?? this.validation,
        onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
        onChange: onChange ?? this.onChange,
        margin: margin ?? this.margin,
        padding: padding ?? this.padding,
        maxLines: maxLines ?? this.maxLines,
        minLines: minLines ?? this.minLines,
        expand: expand ?? this.expand,
        width: width ?? this.width,
        height: height ?? this.height,
        readonly: readonly ?? this.readonly,
      );

  @override
  Widget build(BuildContext context) {
    final StringBuffer inputLabel = StringBuffer();
    inputLabel.write(label);

    if (markAsRequired) {
      inputLabel.write(" *");
    }

    var keyboard = keyboardType;
    if (!kIsWeb && Platform.isIOS && keyboardType == TextInputType.number) {
      keyboard = TextInputType.text;
    }

    final Widget fieldWidget = TextFormField(
      readOnly: readonly ?? false,
      expands: expand,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboard,
      textCapitalization: capitalization,
      controller: controller,
      textInputAction: inputAction,
      focusNode: focusNode,
      onChanged: onChange,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: validationMode,
      autofocus: autofocus,
      obscureText: hideValue,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      inputFormatters: [
        if (formatters != null) ...formatters!,
        LengthLimitingTextInputFormatter(maxLength),
      ],
      validator: validation,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        decoration: TextDecoration.none,
      ).merge(Theme.of(context).textTheme.bodyMedium),
      decoration: InputDecoration(
        labelText: inputLabel.toString(),
        hintText: hint,
        suffix: suffix,
      ),
    );

    return [width, height, margin, padding].any((element) => element != null)
        ? Container(
            width: width,
            height: height,
            margin: margin,
            padding: padding,
            child: fieldWidget,
          )
        : fieldWidget;
  }
}
