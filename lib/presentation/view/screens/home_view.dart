import 'package:flutter/material.dart';
import 'package:streaky/core/theming/colors.dart';
import 'package:streaky/core/theming/styles.dart';
import 'package:streaky/core/utils/constants.dart';
import 'package:streaky/core/utils/spacing.dart';
import 'package:streaky/presentation/view/widgets/home/day_widget.dart';
import 'package:streaky/presentation/view/widgets/home/day_widget_list_view.dart';
import 'package:streaky/presentation/view/widgets/home/habit_item_grid_view.dart';
import 'package:streaky/presentation/view/widgets/home/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
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
          HabitItemGridView()
        ],
      ),
    );
  }
}

