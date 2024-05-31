
import 'package:block_demo/bloc_demo/bloc.dart';
import 'package:block_demo/home_screen.dart';
import 'package:block_demo/riverpod_demo/riverpod_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as r;
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'provider_demo/provider_notifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( GetMaterialApp(
theme: ThemeData(

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      onPrimary: Colors.deepPurpleAccent.withOpacity(0.2),
 primary: Colors.deepPurpleAccent.withOpacity(0.2),
      elevation: 1
    ),

  ),
  ),
    debugShowCheckedModeBanner: false,
    home:HomeScreen()
     ));
}




