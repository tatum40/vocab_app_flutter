import 'package:flutter/material.dart';
import 'package:vocab_app/dragSentence.dart';
import 'package:vocab_app/home.dart';
import 'package:vocab_app/theme/color.dart';

class FinishPage extends StatelessWidget {
  const FinishPage(
      {Key? key, required this.answerPoint, required this.exerciseData})
      : super(key: key);

  final int answerPoint;
  final String exerciseData;

  void navigate(context, numberType) {
    if (numberType == 1) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
          (Route route) => false);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DragSentence(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              child: Icon(
                Icons.emoji_events,
                color: mcl1,
                size: 100,
              )),
          Container(
            child: Text(
              '$answerPoint' + " คะแนน",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 80.0),
              child: _buildButtonMenu(context)),
        ],
      ),
    );
  }

  Widget _buildButtonMenu(context) {
    Widget _button(icon, numberType) {
      return Container(
        width: 85,
        height: 85,
        child: MaterialButton(
          padding: EdgeInsets.all(0.0),
          onPressed: () => navigate(context, numberType),
          child: Icon(
            icon,
            size: 50,
          ),
          shape: CircleBorder(side: BorderSide(width: 1)),
        ),
      );
    }

    if (exerciseData == 'animal') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _button(Icons.home, 1),
          _button(Icons.arrow_forward, 2)
        ],
      );
    } else {
      return _button(Icons.home, 1);
    }
  }
}
