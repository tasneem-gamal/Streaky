import 'package:flutter/material.dart';
import 'package:streaky/core/theming/colors.dart';
import 'package:streaky/core/theming/styles.dart';
import 'package:streaky/data/models/habit_model.dart';

class HabitItem extends StatefulWidget {
  const HabitItem({
    super.key, required this.habit,
  });

  final HabitModel habit;

  @override
  State<HabitItem> createState() => _HabitItemState();
}
  
  bool? isChecked = false;

class _HabitItemState extends State<HabitItem> {
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
                Icon(IconData(widget.habit.habitIconCodePoint, fontFamily: 'MaterialIcons'), size: 40,),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: isChecked, 
                    onChanged: (value){
                      setState(() {
                        isChecked = value;
                      });
                    },
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
                  widget.habit.habitName,
                  style: CustomTextStyles.font24BlackBold(context),
                ),
                Text(
                  widget.habit.habitDescription,
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
