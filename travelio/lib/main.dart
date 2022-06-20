import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_io/screens/home_screen.dart';
import 'package:travel_io/screens/onBoarding.dart';
import 'package:travel_io/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAa8a1i3PtWSC4DkZM9Zcw72o2eNmgJPXo',
      appId: '1:990306926867:android:9ea975401815a9b5445ae6',
      messagingSenderId: '990306926867',
      projectId: 'travelio-61521',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Welcome(),
    );
  }
}
