import 'package:flutter/material.dart';
import 'package:vocab_app/Gallery/gallery.dart';
import 'package:vocab_app/exercise.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: "Sarabun"),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50.0),
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/image/logo.png'),
                ),
                Container(
                  child: Text(
                    'Vocabulary',
                    style: TextStyle(color: Colors.amber, fontSize: 50),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: 250,
                  height: 50,
                  child: MaterialButton(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide:
                          BorderSide(width: 2, color: Colors.blueAccent),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Exercise(),
                      ),
                    ),
                    child: Text(
                      'Start',
                      style:
                          TextStyle(color: Colors.lightGreen, fontSize: 25.0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: 250,
                  height: 50,
                  child: MaterialButton(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide:
                          BorderSide(width: 2, color: Colors.blueAccent),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Gallery(),
                      ),
                    ),
                    child: Text(
                      'Gallery',
                      style:
                          TextStyle(color: Colors.lightGreen, fontSize: 25.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}