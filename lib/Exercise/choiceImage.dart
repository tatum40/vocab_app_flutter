import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vocab_app/content/contentData.dart';
import 'package:vocab_app/widget/dialog_widget.dart';
import 'package:vocab_app/finishPage.dart';
import 'package:vocab_app/home.dart';
import 'package:vocab_app/theme/color.dart';

class ChoiceImage extends StatefulWidget {
  const ChoiceImage({Key? key}) : super(key: key);

  @override
  _ChoiceImageState createState() => _ChoiceImageState();
}

class _ChoiceImageState extends State<ChoiceImage> {
  int currentChoice = 1;
  String showImage = "";
  int pointAnswer = 0;
  bool isCorrect = false;
  bool isFinish = false;

  void _getImage(dynamic data) {
    setState(() {
      showImage = data.correctImg;
      if (data.name == sentenceExercise[currentChoice - 1].name) {
        pointAnswer++;
        isCorrect = true;
      } else {
        isCorrect = false;
      }
    });
    dilaog(isCorrect);
  }

  void dilaog(isCorrect) {
    showDialog(
      context: context,
      builder: (context) => DialogAnswer(
          isCorrect: isCorrect,
          data: 'fruit',
          nextChoice: nextChoice,
          currentChoice: currentChoice),
    );
  }

  void nextChoice() {
    setState(() {
      if (currentChoice != sentenceExercise.length) {
        currentChoice++;
        showImage = '';
        Navigator.pop(context);
      } else {
        isFinish = true;
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
        padding: EdgeInsets.all(0.0),
        icon: Icon(Icons.close),
        onPressed: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
          (Route route) => false,
        ),
      ),
      title: Container(
        child: LinearPercentIndicator(
            padding: EdgeInsets.all(0.0),
            width: MediaQuery.of(context).size.width * 0.7,
            lineHeight: 10,
            backgroundColor: mcl4,
            progressColor: mcl1,
            percent: currentChoice / allfruit.length),
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: Center(
          child: !isFinish
              ? Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text(
                        "Choose the correct picture from the following sentences.",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Expanded(
                      child: _buildTarget(),
                      flex: 1,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: double.infinity,
                      child: Wrap(
                        children: [
                          Text(
                            sentenceExercise[currentChoice - 1].sentence,
                            style: TextStyle(fontSize: 20.0),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: DragImage(),
                      flex: 1,
                    ),
                  ],
                )
              : FinishPage(
                  answerPoint: pointAnswer,
                  exerciseData: 'fruit',
                ),
        ),
      ),
    );
  }

  Widget _buildTarget() => DragTarget(
        builder: (context, data, reject) {
          return Container(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(10.0),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: mcl28,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 1,
                    color: Colors.black12,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: showImage == '' ? null : Image.asset(showImage),
            ),
          );
        },
        onAccept: (data) {
          _getImage(data);
        },
      );
}

class DragImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Wrap(
          children: <Widget>[
            for (var i = 0; i < allfruit.length; i++)
              Draggable<Fruit>(
                data: allfruit[i],
                child: _buildImg(allfruit[i]),
                feedback: _buildImg(allfruit[i]),
                childWhenDragging: _buildChild(),
              ),
          ],
        ),
      );

  Widget _buildImg(fruit) => Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        width: 100,
        height: 100,
        child: Image.asset(fruit.correctImg),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Colors.amber[100],
        ),
      );

  Widget _buildChild() => Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Colors.amber[100],
        ),
      );
}
