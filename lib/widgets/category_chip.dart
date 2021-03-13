import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class CategoryChip extends StatelessWidget {
  final bool isSelected;
  final String label;

  CategoryChip({
    @required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    Color chipColor = isSelected ? secondaryColor : grayColor;

    return Chip(
      backgroundColor: Colors.transparent,
      label: Text(
        label,
        style: TextStyle(color: chipColor),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: chipColor),
      ),
    );
  }
}
