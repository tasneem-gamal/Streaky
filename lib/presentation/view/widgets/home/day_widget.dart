import 'package:flutter/material.dart';
import 'package:streaky/core/theming/colors.dart';
import 'package:streaky/core/theming/styles.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              '11',
              style: CustomTextStyles.font16BlackBold(context),
            ),
            Text(
              'Mon',
              style: CustomTextStyles.font16BlackBold(context),
            )
          ],
        ),
      ),
    );
  }
}

