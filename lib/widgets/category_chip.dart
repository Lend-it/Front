import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class CategoryChip extends StatelessWidget {
  final bool isSelected;
  final String label;
  final Function onTapHandler;

  CategoryChip({
    @required this.label,
    @required this.onTapHandler,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    Color chipColor = isSelected ? secondaryColor : grayColor;
    Duration animationDuration = Duration(milliseconds: 300);

    return InkWell(
      onTap: onTapHandler,
      child: AnimatedContainer(
        duration: animationDuration,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: animationDuration,
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: chipColor,
                ),
            child: Text(label),
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: chipColor),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
