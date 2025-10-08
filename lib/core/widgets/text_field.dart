import 'package:flutter/material.dart';
import 'package:starter_app/cubit/theme_cubit.dart';

class TextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool isPadding;
  final String? hintName;
  final Widget? icon;
  final bool isPrefixIcon;
  final bool isObscureText;
  final TextInputType inputType;
  final bool isEnable;
  final Color? backgroundColor;
  final Color? textColor;
  final int maxLines;
  final bool readOnly;
  final Function? onTap;
  final Function? onChanged;
  final Function? validator;
  final Function? onFieldSubmitted;
  final Color? filledColor;
  final String obscuringCharacter;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final Widget? suffixImage;
  final Iterable<String>? autofillHints;
  final TextCapitalization? textCaps;
  final String? labelText;
  final Color? labelColor;
  final String? initialValue;
  final String? errorText;
  final bool? isEnableBorder;
  final bool? isLabel;

  const TextField({
    super.key,
    this.textColor,
    this.backgroundColor,
    this.isPadding = false,
    this.controller,
    this.hintName,
    this.isPrefixIcon = false,
    this.icon,
    this.isObscureText = false,
    this.focusNode,
    this.nextFocusNode,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    this.readOnly = false,
    this.filledColor,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.textCaps,
    this.autofillHints,
    this.textInputAction = TextInputAction.next,
    this.obscuringCharacter = "•",
    this.isEnable = true,
    this.suffixImage,
    this.labelText,
    this.labelColor,
    this.initialValue,
    this.errorText,
    this.isEnableBorder,
    this.isLabel,
  });

  @override
  State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  late bool _obscureText;
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _fieldKey,
      initialValue: widget.initialValue,
      autofillHints: widget.autofillHints,
      controller: widget.controller,
      cursorColor: context.colors.secondary,
      style: context.textTheme.bodyMedium?.copyWith(
        color: widget.textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      obscureText: _obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      enabled: widget.isEnable,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      textCapitalization: widget.textCaps ?? TextCapitalization.none,
      onTap: () => widget.onTap?.call(),
      onChanged: (value) {
        widget.onChanged?.call(value);
        // Validate only this field
        _fieldKey.currentState?.validate();
      },
      keyboardType: widget.inputType,
      validator: (value) => widget.validator?.call(value),
      focusNode: widget.focusNode,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onFieldSubmitted: (value) => widget.onFieldSubmitted?.call(),
      textInputAction: widget.textInputAction,

      decoration: InputDecoration(
        prefixIcon: widget.isPrefixIcon ? widget.icon : null,
        prefixIconColor: context.colors.primary,
        iconColor: context.colors.primary,
        errorText: widget.errorText,
        suffixIcon: widget.isObscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: context.colors.primary,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixImage,
        // contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 21),
        // contentPadding: EdgeInsets.only(top: 10, left: 8),
        // contentPadding: const EdgeInsets.symmetric(
        //   vertical: 16,
        //   horizontal: 20,
        // ),
        contentPadding: EdgeInsets.only(
          top: widget.isPadding ? 10 : 16,
          left: widget.isPadding ? 12 : 20,
          // right: 20,
          bottom: widget.isPadding ? 0 : 16,
        ),
        alignLabelWithHint: true,

        label: widget.isLabel == true
            ? Text(
                widget.hintName!,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: widget.labelColor,
                ),
              )
            : null,
        hintText: widget.hintName ?? '',
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: widget.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: _fieldKey.currentState?.hasError == true
                ? context.colors.error
                : context.colors.secondary,
            width: 1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: _fieldKey.currentState?.hasError == true
                ? context.colors.error
                : context.colors.secondary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: widget.isEnableBorder == true
                ? context.colors.secondary
                : context.colors.background,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: context.colors.error, width: 1),
        ),
        errorStyle: TextStyle(
          overflow: TextOverflow.clip,
          color: context.colors.error,
          fontSize: 12,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText;
  }
}
