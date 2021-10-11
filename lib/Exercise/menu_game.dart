import 'package:flutter/material.dart';
import 'package:vocab_app/Exercise/spellingBee.dart';
import 'package:vocab_app/widget/GadientText_widget.dart';
import 'package:vocab_app/Exercise/choiceImage.dart';
import 'package:vocab_app/Exercise/dropVocab.dart';

class MenuGame extends StatelessWidget {
  const MenuGame({Key? key}) : super(key: key);

  void _toGamePage(context, gamePage) {
    if (gamePage == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DropVocab()),
      );
    } else if (gamePage == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChoiceImage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SpellingBee()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              GadientText(
                titleShow: 'Game',
              ),
              _buildButtonGame(context, 'Drop Vocab to Image', 1),
              _buildButtonGame(context, 'Choice Image to Correct', 2),
              _buildButtonGame(context, 'Complete Vocab', 3)
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 100,
          height: 45,
          child: FloatingActionButton(
            backgroundColor: Colors.purple[200],
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Back',
              style: TextStyle(color: Colors.black),
            ),
            shape: OutlineInputBorder(
              borderSide: BorderSide(
                width: 3,
                color: Colors.deepPurple,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonGame(context, String title, int gamePage) {
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
          borderSide: BorderSide(
            width: 3,
            color: Colors.deepPurple,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
        onPressed: () => _toGamePage(context, gamePage),
      ),
    );
  }
}
