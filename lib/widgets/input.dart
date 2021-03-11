import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class Input extends StatefulWidget {
  final String placeholder;
  final IconData icon;

  Input({
    @required this.placeholder,
    @required this.icon,
  });

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  final _nameController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 57,
      child: TextFormField(
        controller: _nameController,
        focusNode: focusNode,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryLightColor, width: 2.0)),
          prefixIcon: Icon(widget.icon,
              color: focusNode.hasFocus ? primaryLightColor : grayColor),
          hintText: widget.placeholder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: grayColor),
          ),
        ),
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
