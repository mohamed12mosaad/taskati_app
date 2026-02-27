import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
class CustomSvgPicture extends StatelessWidget {
  const CustomSvgPicture({super.key, required this.path, this.color, this.width, this.height,});

  final String path;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      colorFilter: color != null ? ColorFilter.mode(
        color!,BlendMode.srcIn,)
        : null,
        width: width,
        height: height,
    );
  }
}
