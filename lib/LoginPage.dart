import 'package:apple/first_screen.dart';
import 'package:apple/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: 150,),
              SizedBox(height: 50,),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _signInButton(){
    return  SignInButton(Buttons.Google,
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        text: 'Sign up with Google', onPressed: () {
      signInWithGoogle().whenComplete(() {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return FirstScreen();
          },
          ),
        );
      });
      
        }
        );

  }
}
