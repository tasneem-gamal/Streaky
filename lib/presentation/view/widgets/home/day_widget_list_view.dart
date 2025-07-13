import 'package:flutter/material.dart';
import 'package:streaky/core/utils/spacing.dart';
import 'package:streaky/data/models/day_model.dart';
import 'package:streaky/presentation/view/widgets/home/day_widget.dart';

class DayWidgetListView extends StatelessWidget {
  const DayWidgetListView({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    
    final now = DateTime.now();
    final List<DayModel> days = List.generate(20, (index){
      final date = now.add(Duration(days: index));
      return DayModel(
        dayNumber: date.day, 
        dayName: getShortDayName(date.weekday)
      );
      }
    );

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 70,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => DayWidget(
            day: days[index],
          ), 
          separatorBuilder: (context, index) => horizontalSpace(context, 8), 
          itemCount: days.length
        ),
      ),
    );
  }

  String getShortDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }
}

