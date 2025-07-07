import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streaky/core/theming/colors.dart';
import 'package:streaky/core/utils/constants.dart';
import 'package:streaky/core/utils/spacing.dart';
import 'package:streaky/presentation/controllers/bloc/habit_bloc.dart';
import 'package:streaky/presentation/view/screens/add_habit_bottom_sheet.dart';
import 'package:streaky/presentation/view/widgets/home/day_widget_list_view.dart';
import 'package:streaky/presentation/view/widgets/home/habits_bloc_builder.dart';
import 'package:streaky/presentation/view/widgets/home/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HabitBloc()..add(Loadhabits()),
      child: Scaffold(
        body: HomeViewBody(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
                iconSize: 40,
              ),
              FloatingActionButton(
                elevation: 1,
                backgroundColor: ColorsManager.mainColor,
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) => AddHabitBottomSheet(),
                  );
                },
                child: Icon(Icons.add, color: Colors.white),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: ColorsManager.greenShade,
                child: Icon(Icons.person, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: CustomScrollView(
        slivers: [
          HomeAppBar(),
          SliverToBoxAdapter(child: verticalSpace(context, 24)),
          DayWidgetListView(),
          SliverToBoxAdapter(child: verticalSpace(context, 24)),
          HabitsBlocBuilder()
        ],
      ),
    );
  }
}
