import 'package:flutter/material.dart';

import 'widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static const String id = "OnboardingView";

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnboardingViewBody(),
      ),
    );
  }
}
