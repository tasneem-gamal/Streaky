import 'package:flutter/material.dart';
import 'package:streaky/data/models/habit_model.dart';
import 'package:streaky/presentation/view/widgets/home/habit_item.dart';

class HabitItemGridView extends StatelessWidget {
  const HabitItemGridView({
    super.key,
    required this.habits,
  });

  final List<HabitModel> habits;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7,
        crossAxisSpacing: 12,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => HabitItem(
          habit: habits[index],
        ),
        childCount: habits.length,
      ),
    );
  }
}
