import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 0)
class HabitModel extends HiveObject {
  @HiveField(0)
  String habitName;

  @HiveField(1)
  String habitDescription;

  @HiveField(2)
  String habitInterval;

  @HiveField(3)
  int habitIconCodePoint;

  HabitModel({
    required this.habitName, 
    required this.habitDescription,
    required this.habitInterval,
    required this.habitIconCodePoint
  });

  IconData get habitIcon => IconData(habitIconCodePoint, fontFamily: 'MaterialIcons');
}