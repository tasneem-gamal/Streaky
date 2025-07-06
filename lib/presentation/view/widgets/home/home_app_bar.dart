import 'package:flutter/material.dart';
import 'package:streaky/core/theming/styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
    );
  }
}