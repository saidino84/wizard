import 'dart:ui';

var xml = """
  <color name="primaryColor">#d81b60</color>
  <color name="primaryLightColor">#ff5c8d</color>
  <color name="primaryDarkColor">#a00037</color>
  <color name="secondaryColor">#512da8</color>
  <color name="secondaryLightColor">#8559da</color>
  <color name="secondaryDarkColor">#140078</color>
  <color name="primaryTextColor">#ffffff</color>
  <color name="secondaryTextColor">#ffffff</color>
""";

class AppColors {
  static final primaryColor = Color(0xffd81b60);
  static final primaryLightColor = Color(0xffff5c8d);
  static final primaryColorDarkColor = Color(0xffa00037);
  static final secondaryColor = Color(0xff512da8);
  static final secondaryLightColor = Color(0xff8559da);
  static final secondaryDarkColor = Color(0xff140078);
  static final primaryTextColor = Color(0xffffffff);
  static final secondaryTextColor = Color(0xffffffff);
}
