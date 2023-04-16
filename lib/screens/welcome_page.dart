import 'package:flutter/material.dart';
import 'package:fitness_app/screens/home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  static String id ="welcome_screen";

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image(
                  image: AssetImage('images/dumbbell.png'),
                  height: 300.0,
                ),
              ),
              Text(
                'Your Workout Companion',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w800,
                color: Colors.black
              ),
              ),
              Text(
                'Track your daily workout & watch your progress',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 20.0,
                color: Colors.grey,
              ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, HomeScreen.id);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    width: 130.0,
                    height: 50.0,
                    child: Text(
                      'Get Started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

