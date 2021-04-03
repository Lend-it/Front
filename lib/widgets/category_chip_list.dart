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
  @override
  _CategoryChipListState createState() => _CategoryChipListState();
}

class _CategoryChipListState extends State<CategoryChipList> {
  int _selectedChipIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (ctx, index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CategoryChip(
            label: categories[index].title,
            isSelected: index == _selectedChipIndex,
            onTapHandler: () {
              setState(() {
                _selectedChipIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
