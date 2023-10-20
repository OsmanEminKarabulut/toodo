import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//Henüz hiçbir toodo ekli değilken gösterilecek olan widget.

class EmptyPageWidget extends StatelessWidget {
  const EmptyPageWidget({
    required this.toodoBodyText,
  });

  final String toodoBodyText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset("assets/lottie/bounce_animation.json"),
          Text(
            toodoBodyText,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
