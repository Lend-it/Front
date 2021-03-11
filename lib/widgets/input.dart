import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class Input extends StatefulWidget {
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
          prefixIcon: Icon(Icons.mail,
              color: focusNode.hasFocus ? primaryLightColor : Colors.black26),
          hintText: "placeHolder",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.black38),
          ),
        ),
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
