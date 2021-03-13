import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class Input extends StatefulWidget {
  final TextInputType type;
  final String placeholder;
  final IconData icon;
  final TextEditingController controller;
  final FocusNode focusNode;

  Input({
    @required this.placeholder,
    @required this.icon,
    @required this.type,
    @required this.controller,
    @required this.focusNode,
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
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() => _fieldColor = hasFocus ? primaryColor : grayColor);
        },
        child: TextFormField(
          obscureText:
              widget.type == TextInputType.visiblePassword ? true : false,
          keyboardType: widget.type,
          onChanged: (text) {
            print(_focusNode.hasFocus);
            print(text);
          },
          controller: widget.controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryLightColor, width: 2.0)),
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
