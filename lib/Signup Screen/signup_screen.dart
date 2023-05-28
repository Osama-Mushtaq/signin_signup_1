import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signin_signup_1/Login%20Screen/login_screen.dart';
import 'package:signin_signup_1/signedin_or_signup.dart';

import '../constants.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FROM_STATE,
  SHOW_OTP_FROM_STATE,
}

class SignupBody extends StatefulWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FirebaseAuth _auth = FirebaseAuth.instance;
    final phonecontroller = TextEditingController();
    final otpcontroller = TextEditingController();
    MobileVerificationState currentState =
        MobileVerificationState.SHOW_MOBILE_FROM_STATE;
    String verificationId;
    bool loading = false;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            //top and bottom svgs
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/signup_top.png",
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/main_bottom.png",
                  width: size.width * 0.25),
            ),
            //body
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SIGNUP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                //main svg
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.3,
                ),
                //name field
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kLightPrimaryColour,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColour,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //number field
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kLightPrimaryColour,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    obscureText: true,
                    controller:phonecontroller,
                    decoration: const InputDecoration(
                      hintText: "Mobile number",
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
                //signup button
                Container(
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColour,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 40,
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        await _auth.verifyPhoneNumber(
                            phoneNumber: phonecontroller.text,
                            verificationCompleted: (PhoneAuthCredential) async {
                              setState(() {
                                loading = false;
                              });
                            },
                            verificationFailed: (verificationFailed) async {
                              setState(() {
                                loading = false;
                              });
                            },
                            codeSent: (verificId, resendingToken) async {
                              setState(() {
                                loading = false;
                                currentState =
                                    MobileVerificationState.SHOW_OTP_FROM_STATE;
                                verificationId = verificId;
                              });
                            },
                            codeAutoRetrievalTimeout:
                                (verificationId) async {});},
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Alreadyhaveaccount_check(
                  false,
                  LoginScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
