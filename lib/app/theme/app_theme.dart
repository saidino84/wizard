import 'package:google_fonts/google_fonts.dart';
import 'package:wizard/app/ui/utils/helpers.dart';

final appBarTheme = AppBarTheme(
    centerTitle: false, elevation: 0, backgroundColor: AppColors.primaryColor);
ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    primaryColor: kPrimaryLightColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme:
        AppBarTheme(brightness: Brightness.dark, color: kPrimaryLightColor),
    iconTheme: IconThemeData(color: kContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: kPrimaryLightColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    brightness: Brightness.light,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryLightColor),
      showSelectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    primaryColor: kPrimaryDarkColor,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme:
        AppBarTheme(brightness: Brightness.dark, color: kPrimaryDarkColor),
    iconTheme: IconThemeData(color: kContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
        primary: kPrimaryLightColor,
        secondary: kSecondaryColor,
        error: kErrorColor),
    brightness: Brightness.dark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryLightColor),
      showUnselectedLabels: true,
    ),
  );
}
