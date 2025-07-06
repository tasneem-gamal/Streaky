import 'package:flutter/material.dart';
import 'package:streaky/core/theming/colors.dart';
import 'package:streaky/core/theming/styles.dart';
import 'package:streaky/core/utils/constants.dart';
import 'package:streaky/core/utils/extensions.dart';
import 'package:streaky/core/utils/spacing.dart';
import 'package:streaky/core/widgets/custom_app_button.dart';
import 'package:streaky/presentation/view/screens/home_view.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: GetStartedViewBody(),
    );
  }
}

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.appPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Build healthy \nhabits with us',
            textAlign: TextAlign.center,
            style: CustomTextStyles.font32WhiteBold(context)
          ),
          verticalSpace(context, 24),
          Image.asset('assets/images/get_started.png'),
          verticalSpace(context, 24),
          CustomAppButton(
            onPressed: (){
              context.pushReplacement(HomeView());
            },
            btnText: 'Get Started',
          ),
          verticalSpace(context, 12),
          TextButton(
            onPressed: (){}, 
            child: Text(
              'I have an account',
              style: CustomTextStyles.font14WhiteBold(context).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationThickness: 1.4,
              ),
            )
          )
        ],
      ),
    );
  }
}