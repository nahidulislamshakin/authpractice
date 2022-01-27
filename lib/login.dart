import 'package:authpractice/authentication.dart';
import 'package:authpractice/home.dart';
import 'package:authpractice/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget{
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  String mail="";
  String password="";
  final _formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return MaterialApp(
      home: Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyApp()));

              },child: Text("Registration"),),
              Center(
                child: Form(
                  key: _formkey,
                  child: Column(

                    children: [
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: TextFormField(
                          onChanged: (value){
                            setState(() {
                              mail = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: TextFormField(
                          onChanged: (value){
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                      ),
                      RaisedButton(onPressed: ()async{
                        await authService.signInWithEmailAndPassword(mail, password);
                        if(authService.user !=null)  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));


                      },
                        child: Text("Submit"),)
                    ],
                  ),
                ),
              )

            ],)
      ),
    );
  }
}