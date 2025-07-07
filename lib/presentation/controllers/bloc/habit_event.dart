part of 'habit_bloc.dart';

@immutable
sealed class HabitEvent {}
class Loadhabits extends HabitEvent{}
class AddHabit extends HabitEvent{
  final HabitModel habit;

  AddHabit(this.habit);
}
