import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class Input extends StatefulWidget {
  final TextInputType type;
  final String placeholder;
  final IconData prefix;
  final bool isPassword;
  final TextEditingController controller;
  final Function suffixTapHandler;

  Input({
    @required this.placeholder,
    @required this.type,
    @required this.controller,
    this.prefix,
    this.isPassword = false,
    this.suffixTapHandler,
  });

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  FocusNode _focusNode;
  Color _fieldColor;
  bool _isObscure = true;

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

  void _toggleObscureText() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() => _fieldColor = hasFocus ? primaryColor : grayColor);
        },
        child: TextFormField(
          obscureText:
              widget.type == TextInputType.visiblePassword ? _isObscure : false,
          keyboardType: widget.type,
          controller: widget.controller,
          focusNode: _focusNode,
          style: Theme.of(context).textTheme.bodyText2,
          decoration: InputDecoration(
            contentPadding: new EdgeInsets.symmetric(vertical: 18),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: grayColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: primaryLightColor,
                width: 2.0,
              ),
            ),
            prefixIcon: Icon(widget.prefix, color: _fieldColor),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isObscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: _fieldColor,
                    ),
                    onPressed: _toggleObscureText,
                  )
                : null,
            hintText: widget.placeholder,
          ),
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
