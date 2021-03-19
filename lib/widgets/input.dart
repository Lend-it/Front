import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class Input extends StatefulWidget {
  final TextInputType type;
  final String placeholder;
  final IconData icon;
  final TextEditingController controller;

  Input({
    @required this.placeholder,
    @required this.icon,
    @required this.type,
    @required this.controller,
  });

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  FocusNode _focusNode;
  Color _fieldColor;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 57,
      margin: EdgeInsets.only(bottom: 16),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() => _fieldColor = hasFocus ? primaryColor : grayColor);
        },
        child: TextFormField(
          onChanged: (text) {
            setState(() {
              widget.controller.text = text;
            });
          },
          obscureText:
              widget.type == TextInputType.visiblePassword ? true : false,
          keyboardType: widget.type,
          controller: widget.controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: primaryLightColor,
                width: 2.0,
              ),
            ),
            prefixIcon: Icon(widget.icon, color: _fieldColor),
            hintText: widget.placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: grayColor),
            ),
          ),
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
