part of 'habit_bloc.dart';

@immutable
sealed class HabitState {}

final class HabitInitial extends HabitState {}
final class HabitLoaded extends HabitState {
  final List<HabitModel> habits;

  HabitLoaded(this.habits);
}
