import 'package:flutter/material.dart';
import 'package:streaky/core/theming/colors.dart';
import 'package:streaky/core/theming/styles.dart';

class HabitItem extends StatelessWidget {
  const HabitItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.pinkShade,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.book, size: 40,),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: false, 
                    onChanged: (onChanged){},
                    shape: CircleBorder(),
                    side: BorderSide(color: Colors.black),
                    fillColor: WidgetStateProperty.resolveWith<Color>((states){
                      if(states.contains(WidgetState.selected)){
                        return Colors.black;
                      }
                      return Colors.transparent;
                    }),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reading',
                  style: CustomTextStyles.font24BlackBold(context),
                ),
                Text(
                  'Read 20 pages',
                  style: CustomTextStyles.font16BlackBold(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
