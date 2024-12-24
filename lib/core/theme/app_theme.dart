import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nms_app/core/values/app_color.dart';

// Light Color Scheme
ColorScheme lightColorScheme = ColorScheme(
  primary: AppColor.lightPrimaryColor,
  secondary: AppColor.lightSecondaryColor,
  background: AppColor.lightSecondaryBackgroundColor,
  surface: AppColor.lightSecondaryBackgroundColor,
  onBackground: AppColor.blackColor,
  error: AppColor.darkRedColor,
  onError: AppColor.blackColor,
  onPrimary: AppColor.blackColor,
  onSecondary: AppColor.blackColor,
  onSurface: AppColor.blackColor,
  brightness: Brightness.light,
);

final Color _lightFocusColor = Colors.black.withOpacity(0.12);

final ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);

String getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.shortestSide < 600 ? 'phone' : 'tablet';
}

final FontSizeTiny = getDeviceType() == 'tablet' ? 14.0 : 12.0;
final FontSizeSmall = getDeviceType() == 'tablet' ? 16.0 : 14.0;
final FontSizeMedium = getDeviceType() == 'tablet' ? 18.0 : 16.0;
final FontSizeLarge = getDeviceType() == 'tablet' ? 20.0 : 18.0;
final FontSizeLargeX = getDeviceType() == 'tablet' ? 22.0 : 20.0;
final FontSizeLargeXX = getDeviceType() == 'tablet' ? 25.0 : 20.0;
final FontSizeBig = getDeviceType() == 'tablet' ? 50.0 : 50.0;

ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
  return ThemeData(
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.roboto(
          fontSize: FontSizeLarge,
          color: AppColor.whiteColor,
          fontWeight: FontWeight.bold),
      color: AppColor.lightSecondaryBackgroundColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: colorScheme.brightness,
          systemNavigationBarColor: lightColorScheme.primary,
          systemNavigationBarIconBrightness: Brightness.dark),
      iconTheme: const IconThemeData(color: AppColor.whiteColor),
    ),
    iconTheme: IconThemeData(color: colorScheme.onPrimary),
    canvasColor: AppColor.lightSecondaryBackgroundColor,
    // ignore: deprecated_member_use
    scaffoldBackgroundColor: colorScheme.background,
    highlightColor: Colors.transparent,
    focusColor: focusColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
          fontSize: FontSizeLarge, color: AppColor.blackColor),
      titleMedium: GoogleFonts.roboto(
          fontSize: FontSizeMedium, color: AppColor.blackColor),
      titleSmall: GoogleFonts.roboto(
          fontSize: FontSizeSmall, color: AppColor.blackColor),
      bodyLarge: GoogleFonts.roboto(
          fontSize: FontSizeLarge, color: AppColor.blackColor),
      bodyMedium: GoogleFonts.roboto(
          fontSize: FontSizeMedium, color: AppColor.blackColor),
      bodySmall: GoogleFonts.roboto(
          fontSize: FontSizeSmall, color: AppColor.blackColor),
      labelLarge: GoogleFonts.roboto(
          fontSize: FontSizeLarge, color: AppColor.blackColor),
      labelMedium: GoogleFonts.roboto(
          fontSize: FontSizeMedium, color: AppColor.blackColor),
      labelSmall: GoogleFonts.roboto(
          fontSize: FontSizeSmall, color: AppColor.blackColor),
      displayLarge: GoogleFonts.roboto(
          fontSize: FontSizeLarge, color: AppColor.blackColor),
      displayMedium: GoogleFonts.roboto(
          fontSize: FontSizeMedium, color: AppColor.blackColor),
      displaySmall: GoogleFonts.roboto(
          fontSize: FontSizeSmall, color: AppColor.blackColor),
      headlineLarge: GoogleFonts.roboto(
          fontSize: FontSizeLarge, color: AppColor.blackColor),
      headlineMedium: GoogleFonts.roboto(
          fontSize: FontSizeMedium, color: AppColor.blackColor),
      headlineSmall: GoogleFonts.roboto(
          fontSize: FontSizeSmall, color: AppColor.blackColor),
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: GoogleFonts.roboto(
          fontSize: FontSizeMedium, color: AppColor.blackColor),
      unselectedLabelStyle: GoogleFonts.roboto(
          fontSize: FontSizeMedium, color: AppColor.blackColor),
    ),
    dividerColor: AppColor.greyColor.withOpacity(0.3),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          textStyle: GoogleFonts.roboto(
              fontSize: FontSizeLarge, color: AppColor.whiteColor)),
    ),
  );
}
