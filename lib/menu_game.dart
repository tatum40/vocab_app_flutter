import 'package:flutter/material.dart';

class MenuGame extends StatelessWidget {
  const MenuGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              GadientText(),
              _buildButtonGame('Drop Vocab to Image'),
              _buildButtonGame('Choice Image to Correct')
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonGame(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: 300,
      height: 50,
      child: MaterialButton(
        color: Colors.purple[200],
        splashColor: Colors.amber,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
            borderSide: BorderSide(width: 3, color: Colors.deepPurple)),
        child: Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
        onPressed: () {},
      ),
    );
  }
}

class GadientText extends StatefulWidget {
  const GadientText({
    Key? key,
  }) : super(key: key);

  @override
  _GadientTextState createState() => _GadientTextState();
}

class _GadientTextState extends State<GadientText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Text('Game'),
    );
  }
}
