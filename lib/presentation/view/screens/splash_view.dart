import 'package:flutter/material.dart';
import 'package:streaky/core/theming/colors.dart';
import 'package:streaky/presentation/view/widgets/splash/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: SplashViewBody(),
    );
  }
}

