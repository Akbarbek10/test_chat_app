import 'package:flutter/material.dart';
import 'package:test_chat_app/core/theme/colors/theme_colors.dart';

class ThemeTextStyles {
  ThemeTextStyles._();

  static const hintTextRegular16 = TextStyle(
    color: ThemeColors.hintColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const chatTitleTextStyle = TextStyle(
    color: ThemeColors.chatTitleColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.32,
  );

  static const chatSubTitleTextStyle = TextStyle(
    color: ThemeColors.chatStatusColor,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );

  static const messageTextStyle = TextStyle(
    color: ThemeColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );

  static const messageTimeTextStyle = TextStyle(
    color: ThemeColors.messageTimeColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );
}
