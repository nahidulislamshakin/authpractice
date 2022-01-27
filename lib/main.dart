import 'package:authpractice/home.dart';
import 'package:authpractice/login.dart';
import 'package:authpractice/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import './authentication.dart';

FirebaseOptions get firebaseOptions => const FirebaseOptions(
    apiKey: "AIzaSyCA_H3mG6AclrDt-5C6Jp49ZIDZ9XR7YbA",
    appId: "1:73750114527:android:e11ecdf97ad0d855d7b96a",
    messagingSenderId: "73750114527",
    projectId: "department-app-888ef");

Future initializDefault() async {
  FirebaseApp app = await Firebase.initializeApp(options: firebaseOptions);
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializDefault();
  runApp(MultiProvider(

    providers: [
      Provider<AuthService>(create: (_)=> AuthService(),),
    ],
    child: MaterialApp(
       initialRoute: '/wrapper',
      routes: {
        '/login' : (context) => LogIn(),
        '/MyApp' : (context) => MyApp(),
        '/home' : (context) => HomePage(),
        '/wrapper' : (context) => Wrapper(),
      },
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mail = "";
  String password = "";
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    // TODO: implement build
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Text("Registration"),
        Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    onChanged: (value) {
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
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: () async {
                  await authService.createUserWithEmailAndPassword(mail, password);
                  if(authService.user != null ) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogIn()));
                  },
                  child: Text("registar"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => LogIn()));
                  },
                  child: Text("Have an account? Log in"),
                ),
              ],
            ),
          ),
        )
      ],
    ));
    //  ),
    //   );
  }
}
