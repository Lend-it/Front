import 'package:flutter/material.dart';
import 'package:front/widgets/category_chip.dart';

List<String> categories = [
  'Mais próximos',
  'Jogos',
  'Eletrodomésticos',
  'Ferramentas',
  'Pets'
];

class CategoryChipList extends StatelessWidget {
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
            label: categories[index],
          ),
        ),
      ),
    );
  }
}
