import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isNecessary;
  final bool isPassword;
  final bool hasLabel;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;

  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hint,
    required this.isNecessary,
    required this.isPassword,
    required this.hasLabel,
    required this.onSaved,
    required this.validator,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.hasLabel)
          Row(
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              if (widget.isNecessary)
                Text(
                  '·',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
            ],
          ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: widget.hint,
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.multiline,
          obscureText: widget.isPassword,
          onSaved: widget.onSaved,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.always,
        ),
        if (!widget.isPassword) SizedBox(height: 16),
        if (widget.isPassword) SizedBox(height: 8),
      ],
    );
  }
}
