import 'package:flutter/material.dart';
import 'package:front/model/category.model.dart';
import 'package:front/widgets/category_chip.dart';

List<CategoryModel> categories = [
  CategoryModel(id: '1', title: 'Eletrodomésticos'),
  CategoryModel(id: '2', title: 'Livros e revistas'),
  CategoryModel(id: '3', title: 'Eletrônicos'),
  CategoryModel(id: '4', title: 'Ferramentas'),
  CategoryModel(id: '5', title: 'Jogos'),
];

class CategoryChipList extends StatefulWidget {
  final Function getSelectedCategory;
  CategoryChipList({this.getSelectedCategory});

  @override
  _CategoryChipListState createState() => _CategoryChipListState();
}

class _CategoryChipListState extends State<CategoryChipList> {
  int _selectedChipIndex;

  void selectCategory(index) {
    setState(() {
      if (_selectedChipIndex == index) {
        _selectedChipIndex = null;
      } else
        _selectedChipIndex = index;
    });

    // return null when we have to cancel the filter(make a get all)
    widget.getSelectedCategory(
      _selectedChipIndex != null ? categories[_selectedChipIndex] : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (ctx, index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CategoryChip(
            label: categories[index].title,
            isSelected: index == _selectedChipIndex,
            onTapHandler: () => selectCategory(index),
          ),
        ),
      ),
    );
  }
}
