import 'package:flutter/material.dart';
import 'package:streaky/presentation/view/widgets/home/habit_item.dart';

class HabitItemGridView extends StatelessWidget {
  const HabitItemGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 550,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            childAspectRatio: 0.7,
            crossAxisSpacing: 12
          ), 
          itemBuilder: (context, index) => HabitItem(),
          itemCount: 6,
        ),
      ),
    );
  }
}


