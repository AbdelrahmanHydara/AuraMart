import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomAvifImage extends StatelessWidget {
  const CustomAvifImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.toLowerCase().contains('.avif')) {
      return  SizedBox(
        width: width ?? 100.w,
        height: height ?? 125.h,
        child: AvifImage.network(
          imageUrl,
          fit: BoxFit.contain,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (frame != null) return child;
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width ?? double.infinity,
                height: height ?? double.infinity,
                color: Colors.white,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey[200],
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
    } else {
      return FancyShimmerImage(
        imageUrl: imageUrl,
        boxFit: BoxFit.contain,
        height: height ?? 125.h,
        width: width ?? 100.w,
        errorWidget: Icon(Icons.broken_image),
      );
    }
  }
}