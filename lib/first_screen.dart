import 'package:flutter/material.dart';
import 'package:apple/LoginPage.dart';
import 'sign_in.dart';
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [Colors.blue[100],Colors.blue[400]],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(backgroundImage: NetworkImage(imageUrl),
              radius: 60,backgroundColor: Colors.transparent,
              ),
            SizedBox(height: 40,),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),
              Text(name,
              style: TextStyle(
                fontSize: 25,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 20,),
              Text('Email',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black54
              ),),
              Text(
                email, 
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 40,),
              RaisedButton(onPressed: (){
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context){
                  return LoginPage();
                }), ModalRoute.withName('/'));
              },
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Sign Out',
                style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
