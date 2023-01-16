import 'package:flutter/material.dart';
import '../const.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    this.labelText = 'User Name',
    this.obscureText = false,
    this.textInputType = TextInputType.emailAddress,
    this.icon,
    this.iconOnTap,
    this.controller,
    this.validator,
  });
  final String labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final Icon? icon;
  final TextInputType textInputType;
  final VoidCallback? iconOnTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    double sizew = MediaQuery.of(context).size.width;
    double sizeh = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(sizeh * 0.01),
      child: SizedBox(
        height: sizeh * 0.08,
        width: sizew * 0.82,
        child: TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: purplelight, fontSize: sizeh * 0.021),
            suffixIcon: InkWell(onTap: iconOnTap, child: icon),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                style: BorderStyle.solid,
                color: purplelight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  style: BorderStyle.solid, color: purplemedium, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          autofillHints: const [AutofillHints.email],
        ),
      ),
    );
  }
}
