import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:streaky/data/models/habit_model.dart';

part 'habit_event.dart';
part 'habit_state.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  final Box<HabitModel> habitsBox = Hive.box<HabitModel>('habitsBox');

  HabitBloc() : super(HabitInitial()) {
    on<Loadhabits>((event, emit) {
      final habits = habitsBox.values.toList();
      emit(HabitLoaded(habits));
    },);

    on<AddHabit>((event, emit) async{
      await habitsBox.add(event.habit);
      final habits = habitsBox.values.toList();
      emit(HabitLoaded(habits));
    },);
  }
}
