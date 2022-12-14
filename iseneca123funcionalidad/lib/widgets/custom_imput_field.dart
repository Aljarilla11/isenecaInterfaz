import 'package:flutter/material.dart';

class CustomImputField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  bool obscureText;
  final String formProperty;
  final Map<String, String> formValues;

  CustomImputField(
      {Key? key,
      this.hintText,
      this.labelText,
      this.helperText,
      this.icon,
      this.suffixIcon,
      this.keyboardType,
      this.obscureText = false,
      required this.formProperty,
      required this.formValues})
      : super(key: key);

  @override
  State<CustomImputField> createState() => _CustomImputFieldState();
}

class _CustomImputFieldState extends State<CustomImputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.emailAddress,
      obscureText: widget.obscureText,
      onChanged: (value) {
        widget.formValues[widget.formProperty] = value;
        print('value: $value');
      },
      validator: (value) {
        if (value!.isEmpty) return 'Este campo es requerido';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          helperText: widget.helperText,
          suffixIcon: widget.suffixIcon == null
              ? null
              : GestureDetector(
                  onTap: () {
                    widget.obscureText = !widget.obscureText;
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                  ),
                ),
          icon: widget.icon == null ? null : const Icon(Icons.remove_red_eye),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))),
    );
  }
}
