import 'package:flutter/material.dart';
import 'package:streaky/core/theming/colors.dart';
import 'package:streaky/core/theming/styles.dart';
import 'package:streaky/data/models/day_model.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({
    super.key, required this.day,
  });

  final DayModel day;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManager.moreLightGray)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${day.dayNumber}',
              style: CustomTextStyles.font16BlackBold(context),
            ),
            Text(
              day.dayName,
              style: CustomTextStyles.font16BlackBold(context),
            )
          ],
        ),
      ),
    );
  }
}

