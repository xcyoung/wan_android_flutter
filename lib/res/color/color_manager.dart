import 'package:flutter/material.dart';
import 'package:wan_android/res/color/colors.dart';
class ColorManager {
  static ColorManager _instance;
  Brightness _brightness;

  ColorManager._(BuildContext context, Brightness brightness) {
    _brightness = brightness;
  }

  static ColorManager of(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    if (_instance == null || (brightness != _instance._brightness)) {
      _instance = ColorManager._(context, brightness);
    }
    return _instance;
  }

  bool isDark() => _brightness == Brightness.dark;

  get app_main => isDark() ? Colours.app_main : Colours.app_main;
  get color_bg => isDark() ? Colours.color_bg : Colours.color_bg;

  get color_black1 => isDark() ? Colours.color_black1 : Colours.color_black1;
  get color_black2 => isDark() ? Colours.color_black2 : Colours.color_black2;
  get color_black3 => isDark() ? Colours.color_black3 : Colours.color_black3;

  get color_blue1 => isDark() ? Colours.color_blue1 : Colours.color_blue1;
  get color_blue2 => isDark() ? Colours.color_blue2 : Colours.color_blue2;
  get color_blue3 => isDark() ? Colours.color_blue3 : Colours.color_blue3;

  get color_red1 => isDark() ? Colours.color_red1 : Colours.color_red1;
  get color_red2 => isDark() ? Colours.color_red2 : Colours.color_red2;

  get color_orange => isDark() ? Colours.color_orange : Colours.color_orange;
  get color_yellow => isDark() ? Colours.color_yellow : Colours.color_yellow;
  get color_green => isDark() ? Colours.color_green : Colours.color_green;
}
