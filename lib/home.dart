import 'package:authpractice/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("HomePage"),),
          Center(child: RaisedButton(onPressed: ()async{
            await authService.signOut();
          },child: Text("Log out"),),)
        ],
      ),
    );
  }
}