
import 'package:flutter/material.dart';

import 'constants.dart';

class Alreadyhaveaccount_check extends StatelessWidget {
  final bool login;
  //final Function tap;
  final Widget ww;
  const Alreadyhaveaccount_check(this.login,this.ww);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account ? " : "Already have an acoount ? ",
          style: TextStyle(color: kPrimaryColour),
        ),
        GestureDetector(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){return ww;}));},
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: kPrimaryColour,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
