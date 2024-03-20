import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryChips extends StatefulWidget {
  final bool loading;

  CategoryChips({Key? key, this.loading = true}) : super(key: key);

  @override
  _CategoryChipsState createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  List<String> bookCategories = [
    'All',
    'Fiction',
    'Classics',
    'School',
    'Romance',
    'Literature',
    'Novels',
    'Young Adult',
  ];

  int tag = 0;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      ignoreContainers: true,
      enabled: widget.loading,
      child: ChipsChoice.single(
        value: tag,
        onChanged: (value) {
          setState(() => tag = value);
        },
        choiceItems: C2Choice.listFrom(
          source: bookCategories,
          value: (index, value) => index,
          label: (index, value) => value,
        ),
        choiceStyle: C2ChipStyle.outlined(
          borderRadius: BorderRadius.circular(10),
          height: 36,
          selectedStyle: C2ChipStyle.filled(),
          checkmarkStyle: C2ChipCheckmarkStyle.round,
        ),
      ),
    );
  }
}
