import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signin_signup_1/Signup%20Screen/signup_screen.dart';
import 'package:signin_signup_1/constants.dart';
import 'package:signin_signup_1/signedin_or_signup.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
      height: double.infinity,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/login_bottom.png",
                width: size.width * 0.4),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.3,
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 10),
              //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //   width: size.width * 0.8,
              //   decoration: BoxDecoration(
              //     color: kLightPrimaryColour,
              //     borderRadius: BorderRadius.circular(29),
              //   ),
              //   child: const TextField(
              //     decoration: InputDecoration(
              //       hintText: "Email",
              //       icon: Icon(
              //         Icons.person,
              //         color: kPrimaryColour,
              //       ),
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kLightPrimaryColour,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Mobile Number",
                    icon: Icon(
                      Icons.phone,
                      color: kPrimaryColour,
                    ),
                    border: InputBorder.none,
                    // suffixIcon: Icon(
                    //   Icons.visibility,
                    //   color: kPrimaryColour,
                    // ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: size.width * 0.8,
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
                    onPressed: () {},
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Alreadyhaveaccount_check(
                true,
                SignupBody(),
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}


