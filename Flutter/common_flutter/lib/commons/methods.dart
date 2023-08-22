import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enums.dart';

String ets(Enum enumuration) => enumuration.name;

Image assetImage(
  ImageEnum enumuration, {
  double? width,
  double? height,
  BoxFit? fit,
}) =>
    Image.asset(
      'assets/images/${ets(enumuration)}.png',
      errorBuilder: (context, _, __) => assetSVG(SVGEnum.imgerror),
      width: width,
      height: height,
      fit: fit,
    );

SvgPicture assetSVG(
  SVGEnum enumuration, {
  double? width,
  double? height,
}) =>
    SvgPicture.asset(
      'assets/svgs/${ets(enumuration)}.svg',
      width: width,
      height: height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );

dHeight(BuildContext context) => MediaQuery.of(context).size.height;
dOrientation(BuildContext context) => MediaQuery.of(context).orientation;
dWidth(BuildContext context) => MediaQuery.of(context).size.width;

double doub(dynamic value) {
  if (value is int) {
    return value.toDouble();
  }
  if (value is String) {
    return double.tryParse(value.trim()) ?? double.nan;
  }
  return double.nan;
}

Future<bool?> getBoolPref(PrefEnum key) =>
    sharedPrefs().then((pref) => pref.getBool(ets(key)));

Future<double?> getDoublePref(PrefEnum key) =>
    sharedPrefs().then((pref) => pref.getDouble(ets(key)));

Future<int?> getIntPref(PrefEnum key) =>
    sharedPrefs().then((pref) => pref.getInt(ets(key)));

Future<String?> getStringPref(PrefEnum key) =>
    sharedPrefs().then((pref) => pref.getString(ets(key)));

Future<List<String>?> getStringListPref(PrefEnum key) =>
    sharedPrefs().then((pref) => pref.getStringList(ets(key)));

HexColor hexColor(String code) =>
    HexColor(code.contains('#') ? code : '#$code');

Map<NavArgEnum, dynamic> navArgs(BuildContext context) =>
    ModalRoute.of(context)!.settings.arguments as Map<NavArgEnum, dynamic>;

Future<dynamic> navigate(
  BuildContext context, {
  required PageEnum page,
  bool replace = false,
  Map<NavArgEnum, dynamic>? navArgs,
}) {
  if (replace) {
    return Navigator.pushReplacementNamed(
      context,
      ets(page),
      arguments: navArgs,
    );
  } else {
    return Navigator.pushNamed(
      context,
      ets(page),
      arguments: navArgs,
    );
  }
}

bool notNull(dynamic content) => content != null;

T getProvider<T>(BuildContext context)=> context.read<T>();

Future<bool> removePref(PrefEnum key) =>
    sharedPrefs().then((prefs) => prefs.remove(ets(key)));

Future<void> setPref({
  required PrefEnum key,
  required dynamic value,
}) async {
  final prefs = await sharedPrefs();
  final prefKey = ets(key);

  if (value is bool) {
    await prefs.setBool(prefKey, value);
  }
  if (value is double) {
    await prefs.setDouble(prefKey, value);
  }
  if (value is int) {
    await prefs.setInt(prefKey, value);
  }
  if (value is String) {
    await prefs.setString(prefKey, value);
  }
  if (value is List<String>) {
    await prefs.setStringList(prefKey, value);
  }
}

Future<SharedPreferences> sharedPrefs() => SharedPreferences.getInstance();