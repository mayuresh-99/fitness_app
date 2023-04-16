import 'package:fitness_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen({Key? key}) : super(key: key);
  static String id ="login_screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController phoneController =TextEditingController();
  Country selectedCountry =Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
  bool _isObscure = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 35.0),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Container(
                  width: 200,
                  height: 200,
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20.0, 50.0, 10.0, 0.0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      hintText: "Enter Mobile Number",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                                context: context,
                                countryListTheme: CountryListThemeData(
                                  bottomSheetHeight: 550,
                                ),
                                onSelect: (value) {
                                  setState(() {
                                    selectedCountry = value;
                                  });
                                });
                          },
                          child: Text("+${selectedCountry.phoneCode}",
                            style:const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: "Enter Password ",
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:  BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(_isObscure ? Icons.visibility: Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(300.0,10.0,0.0,0.0),
                  child: InkWell(
                    onTap: (){
                    },
                    child: Text('Forgot Password?'),
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
                      width: 500.0,
                      height: 50.0,
                      child: Text(
                        'Login',
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
                Text(
                  'Or Connect With',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){},
                      child: Image( width: 50.0, image: AssetImage('images/Google_Logo.png'),),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Image( width: 50.0, image: AssetImage('images/facebook_logo.png'),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}