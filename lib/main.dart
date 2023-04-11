import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/Cores/services/Server_Locator.dart';
import 'package:moviesapp/PresentationL/Screens/Home_Login.dart';
import 'package:moviesapp/PresentationL/provider/Home_Provider.dart';
import 'package:provider/provider.dart';

void main() async {
  ServerLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movies App',
      home: HomeLogin(),
    );
  }
}
