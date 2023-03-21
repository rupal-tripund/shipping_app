import 'package:flutter/material.dart';
import 'package:shipping_app/constants/size_config.dart';

class Style {

  //colors
  static const primaryThemeColor = Colors.blue;
  static const primaryBackgroundColor = Colors.white;
  static final loginPageBackgroundColor = Colors.lightBlueAccent[400];
  static const brightness = Brightness.light;
  static const textColorDark = Colors.white;
  static const textColorLight = Colors.black;
  static final iconColor = Colors.lightBlueAccent[400];
  static const iconBackgroundColor = Colors.white;
  static final loginPageBackgroundColor2 = Colors.grey[300];


  //font style
  static final sizeTitle = 5 * SizeConfig.textMultiplier;
  static final sizeSubTitle = 2 * SizeConfig.textMultiplier;
  static final sizeIcon = 5 * SizeConfig.textMultiplier;
  static final sizeButtonText = 2.5 * SizeConfig.textMultiplier;
  //button style
  static final buttonHeight = 2.5 * SizeConfig.textMultiplier;
  //layout style
  static final paddingHeight = 3.5 * SizeConfig.textMultiplier;
  static final paddingWidth = 2 * SizeConfig.textMultiplier;
  static final marginLink = 2.5 * SizeConfig.textMultiplier;
  static final formPadding = Style.paddingWidth;


}