import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaky/presentation/controllers/bloc/habit_bloc.dart';
import 'package:streaky/presentation/view/widgets/home/habit_item_grid_view.dart';

class HabitsBlocBuilder extends StatelessWidget {
  const HabitsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitBloc, HabitState>(
      builder: (context, state){
        if(state is HabitLoaded){
          return HabitItemGridView(
            habits: state.habits,
          );
        } else {
          return SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}