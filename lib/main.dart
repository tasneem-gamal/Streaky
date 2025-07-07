import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:streaky/data/models/habit_model.dart';
import 'package:streaky/streaky.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HabitModelAdapter());
  await Hive.openBox<HabitModel>('habitsBox');
  runApp(const Streaky());
}

