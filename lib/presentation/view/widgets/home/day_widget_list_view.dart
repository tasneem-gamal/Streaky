import 'package:flutter/material.dart';
import 'package:streaky/core/utils/spacing.dart';
import 'package:streaky/presentation/view/widgets/home/day_widget.dart';

class DayWidgetListView extends StatelessWidget {
  const DayWidgetListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 70,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => DayWidget(), 
          separatorBuilder: (context, index) => horizontalSpace(context, 8), 
          itemCount: 10
        ),
      ),
    );
  }
}

