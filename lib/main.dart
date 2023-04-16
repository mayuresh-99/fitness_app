import 'package:fitness_app/data/workout_data.dart';
import 'package:fitness_app/firebase_options.dart';
import 'package:fitness_app/screens/login_page.dart';
import 'package:fitness_app/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> WorkoutData(),
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context)=> WelcomePage(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    ),
    );

      // initialRoute: LoginScreen.id,
      // routes: {
      //  LoginScreen.id: (context)=>LoginScreen(),
      //   HomeScreen.id: (context)=> HomeScreen(),
      // },
  }
}

