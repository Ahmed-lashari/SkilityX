import 'package:flutter/material.dart';
import 'package:skility_x/constants/app_colors.dart';

class GradientCircularProgress extends StatefulWidget {
  const GradientCircularProgress({super.key});

  @override
  State<GradientCircularProgress> createState() =>
      _GradientCircularProgressState();
}

class _GradientCircularProgressState extends State<GradientCircularProgress>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      height: 50.0,
      child: RotationTransition(
        turns: _controller,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return SweepGradient(
              colors: [
                // AppColors.error,
                AppColors.secondary,
                AppColors.unselectedItemIcon,
                AppColors.primary,
                // AppColors.error,
              ],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: const CircularProgressIndicator(
            strokeWidth: 6,
            strokeCap: StrokeCap.round,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.error),
            backgroundColor: AppColors.onBackground,
          ),
        ),
      ),
    );
  }
}
