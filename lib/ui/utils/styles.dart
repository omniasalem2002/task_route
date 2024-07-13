import 'dart:ui';
import 'package:route_task/ui/utils/app_colors.dart';

abstract class Styles {
  static TextStyle font22whiteMedium(context) => TextStyle(
      fontFamily: 'Futura',
      fontWeight: FontWeight.w500, // Corresponds to the FuturaPT-Medium.ttf
      fontSize: 22,
      color: AppColors.whiteColor
  );
  static TextStyle font18BlueMedium(context) => TextStyle(
    fontFamily: 'Futura',
    fontWeight: FontWeight.w500,
    fontSize: 18,
      color: AppColors.primaryBlue
  );
  static TextStyle font16whitenormal(context) => TextStyle(
      fontFamily: 'Futura',
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: AppColors.whiteColor
  );
  static TextStyle font15whitenormal(context) => TextStyle(
      fontFamily: 'Futura',
      fontWeight: FontWeight.normal,
      fontSize: 15,
      color: AppColors.whiteColor
  );
  static TextStyle font15whiteBold(context) => TextStyle(
      fontFamily: 'Futura',
      fontSize: 15,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.bold

  );






}
