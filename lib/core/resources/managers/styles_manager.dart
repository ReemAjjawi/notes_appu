import 'package:flutter/material.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/main.dart';

class StylesManager {
  static TextStyle headLineStyle = TextStyle(
    color: ColorManager.headLineColor,
    fontSize: screenWidth * 0.05,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subLineStyle = TextStyle(
    color: ColorManager.subLineColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w400,
  );
  static TextStyle greenButtonStyle = TextStyle(
    color: ColorManager.whiteColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w500,
  );
  static TextStyle whiteButtonStyle = TextStyle(
    color: ColorManager.primaryColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w500,
  );
  static TextStyle hintTextStyle = TextStyle(
    color: ColorManager.hintTextColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w400,
  );
  static TextStyle subTitleStyle = TextStyle(
    color: ColorManager.subTitleColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w400,
  );
  static TextStyle underHintTextStyle = TextStyle(
    color: ColorManager.underHintTextColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w400,
  );
  static TextStyle titleTextStyle = TextStyle(
    color: ColorManager.titleColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleNotificationStyle = TextStyle(
    color: ColorManager.titleNotificationColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w500,
  );
  static TextStyle subTitleNotificationStyle = TextStyle(
    color: ColorManager.subTitleNotificationColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w400,
  );
  static TextStyle offerStyle = TextStyle(
    color: ColorManager.offerColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w500,
  );
  static TextStyle deleteStyle = TextStyle(
    color: ColorManager.whiteColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cancelStyle = TextStyle(
    color: ColorManager.cancelColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w400,
  );
  static TextStyle doneStyle = TextStyle(
    color: ColorManager.doneColor,
    fontSize: screenWidth * 0.03,
    fontWeight: FontWeight.w400,
  );
}
