import 'package:apple/first_screen.dart';

import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterEmail extends StatefulWidget {
  
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email'
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return 'Please enter Email';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password'
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: RaisedButton(onPressed: () async{
                  if(_formKey.currentState.validate()){
                    _register();
                  }

//                  Navigator.of(context).push(
//                    MaterialPageRoute(builder: (context){
//                      return FirstScreen();
//                    },
//                    ),
//                  );
                },
                child: const Text('Submit'),
                ),
              ),
              
            ],
          ),
        ),
        
      ),
    );
  }
  void _register() async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user= (
    await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
    ).user;
    if(user!= null){
      setState(() {
        _success =true;
        _userEmail =user.email;
      });
    }else{
      setState(() {
        _success=true;
      });
    }
  }
}
