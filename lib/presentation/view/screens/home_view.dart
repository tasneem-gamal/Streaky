import 'package:flutter/material.dart';
import 'package:streaky/core/theming/styles.dart';
import 'package:streaky/core/utils/constants.dart';

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
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 70,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Good morning, \nDiana',
                style: CustomTextStyles.font16BlackBold(context),
              ),
            ),
            actions: [
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.notifications)
              )
            ],
          )
        ],
      ),
    );
  }
}