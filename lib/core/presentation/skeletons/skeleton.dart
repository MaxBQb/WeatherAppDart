import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/core/theme.dart';

class SkeletonWidget extends StatelessWidget {
  final double? height, width, borderRadius;
  final Color? color;
  final EdgeInsets? padding;
  const SkeletonWidget(
      {Key? key,
      this.height,
      this.width,
      this.borderRadius,
      this.color,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Shimmer.fromColors(
        highlightColor: color != null
            ? color!.withOpacity(0.4)
            : Theme.of(context).cardColor,
        baseColor: color ?? Theme.of(context).backgroundColor.withOpacity(0.3),
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color ?? AppTheme.skeletonBaseColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}
