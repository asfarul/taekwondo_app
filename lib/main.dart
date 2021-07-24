import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:taekwondo_app/providers/providers.dart';
import 'package:taekwondo_app/ui/screens/screens.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => JoinClubProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: GetMaterialApp(
        title: 'SITAEK App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
