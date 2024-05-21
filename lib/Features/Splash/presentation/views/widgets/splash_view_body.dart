import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../start_view.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/SplashIcon.svg',
        width: 124,
      ),
    );
  }
}
