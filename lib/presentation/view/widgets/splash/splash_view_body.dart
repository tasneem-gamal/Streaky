
import 'package:flutter/material.dart';
import 'package:streaky/core/theming/styles.dart';
import 'dart:math' as math;



class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late List<Animation<Offset>> emojiAnimations;
  final int emojis = 7;

  @override
  void initState() {
    super.initState();
    initRandomAnimation();
  }

  void initRandomAnimation(){
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );
    final random = math.Random();
    emojiAnimations = List.generate(emojis, (index){
      double offsetX = (random.nextDouble() * 0.4) - 0.2;
      double offsetY = (random.nextDouble() * 0.4) - 0.2;
      return Tween<Offset>(begin: Offset(offsetX, offsetY), end: Offset.zero).animate(
        CurvedAnimation(
          parent: animationController, 
          curve: Curves.easeOut
        )
      );
    });
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Streaky',
            style: CustomTextStyles.font32BlackBold(
              context,
            ).copyWith(color: Colors.white),
          ),
        ),
        ...emojiAnimations.asMap().entries.map((entry){
          final index = entry.key;
          final animation = entry.value;
          final random = math.Random(index);
          double alignmentX = random.nextDouble() * 2 - 1;
          double alignmentY = random.nextDouble() * 2 - 1;
          return Align(
            alignment: Alignment(alignmentX, alignmentY),
            child: SlideTransition(
              position: animation,
              child: Image.asset(
                'assets/images/smile_splash.png',
                width: 100,
                height: 100,
              ),
            ),
          );
        })
      ],
    );
  }
}

