import 'package:flutter/material.dart';

const Color themeColor = Color(0xff0083BB);

const List<int> rgbColor = [0, 131, 187];
final Map<int, Color> materialColorMap = {
  50: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .1),
  100: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .2),
  200: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .3),
  300: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .4),
  400: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .5),
  500: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .6),
  600: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .7),
  700: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .8),
  800: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], .9),
  900: Color.fromRGBO(rgbColor[0], rgbColor[1], rgbColor[2], 1),
};
const MaterialColor whiteMaterialColor = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
const productHeight = 210.0;
