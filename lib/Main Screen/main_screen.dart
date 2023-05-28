import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signin_signup_1/Login%20Screen/login_screen.dart';
import 'package:signin_signup_1/Signup%20Screen/signup_screen.dart';
import 'package:signin_signup_1/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size sz=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
      height: sz.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: sz.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: sz.width * 0.2,
            ),
          ),
          SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WELCOME TO THE APP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: sz.height * 0.04,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: sz.height * 0.45,
            ),
            SizedBox(
              height: sz.height * 0.04,
            ),
            Container(
              width: sz.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColour,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                  ),
                  onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context){return LoginScreen();}));},
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: sz.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kLightPrimaryColour,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                  ),
                  onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context){return SignupBody();}));},
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
        ],
      ),
    ),
    );
  }
}