import 'dart:io';

import 'package:common_flutter/home_screen.dart';
import 'package:flutter/material.dart';

import 'enums.dart';
import 'methods.dart';

// Colors
const black = Colors.black;
const error = Colors.red;
final primary = Colors.green.shade700;
const special = Colors.blueGrey;
const transparent = Colors.transparent;

final primaryText = Colors.grey.shade500;
const white = Colors.white;

// Objects
final routes = {
  ets(PageEnum.home): (BuildContext context) => const HomeScreen(),
};

// Platform
final isIOS = Platform.isIOS;

// Other
const dummy = SizedBox();
const inf = double.infinity;

const googleApiKey = 'AIzaSyBXfV9MKcKLsZEDqAC2RmRA6okUi1t9xxM';
