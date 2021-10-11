import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vocab_app/content/contentData.dart';
import 'package:vocab_app/widget/dialog_widget.dart';
import 'package:vocab_app/finishPage.dart';
import 'package:vocab_app/home.dart';
import 'package:vocab_app/theme/color.dart';

class DropVocab extends StatefulWidget {
  const DropVocab({Key? key}) : super(key: key);

  @override
  _DropVocabState createState() => _DropVocabState();
}

class _DropVocabState extends State<DropVocab> {
  int currentChoice = 1;
  bool isFinish = false;
  int answerPoint = 0;

  void _getImage(dynamic data, int num) {
    bool isCorrect = false;

    if (num == allAnimals[currentChoice - 1].correctAnswer) {
      isCorrect = true;
      setState(() {
        answerPoint++;
      });
    } else {
      isCorrect = false;
    }

    dilaog(isCorrect, data);
  }

  void dilaog(isCorrect, data) {
    showDialog(
      context: context,
      builder: (context) => DialogAnswer(
        isCorrect: isCorrect,
        data: data,
        nextChoice: nextChoice,
        currentChoice: currentChoice,
      ),
    );
  }

  void nextChoice() {
    setState(() {
      if (currentChoice != allAnimals.length) {
        currentChoice++;
        Navigator.pop(context);
      } else {
        isFinish = true;
        Navigator.pop(context);
        print(answerPoint);
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
            percent: currentChoice / allAnimals.length),
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
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      margin: EdgeInsets.only(bottom: 2.0),
                      color: mcl1.withOpacity(0.5),
                      width: double.infinity,
                      child: Text(
                        'Drop the answer to correct Pictrue.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: _buildTarget1(),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      width: double.infinity,
                      color: mcl35,
                      child: _buildDragg(),
                    )),
                    Expanded(
                      child: _buildTarget2(),
                    ),
                  ],
                )
              : FinishPage(
                  answerPoint: answerPoint,
                  exerciseData: 'animal',
                ),
        ),
      ),
    );
  }

  Widget _buildTarget1() => DragTarget(
        builder: (context, data, reject) {
          return Container(
            alignment: Alignment.center,
            width: double.infinity,
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
            ),
            child: Stack(
              children: [
                for (var i = 0; i < allAnimals.length; i++)
                  Container(
                    child: Image.asset(allAnimals[currentChoice - 1].img1),
                  )
              ],
            ),
          );
        },
        onAccept: (data) {
          _getImage(data, 1);
        },
      );

  Widget _buildTarget2() => DragTarget(
        builder: (context, data, reject) {
          return Container(
            alignment: Alignment.center,
            width: double.infinity,
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
            ),
            child: Stack(
              children: [
                for (var i = 0; i < allAnimals.length; i++)
                  Container(
                    child: Image.asset(allAnimals[currentChoice - 1].img2),
                  )
              ],
            ),
          );
        },
        onAccept: (data) {
          _getImage(data, 2);
        },
      );

  Widget _buildDragg() => Stack(
        alignment: Alignment.center,
        children: [
          for (var i = 0; i < allAnimals.length; i++)
            DragObjectBox(allAnimals[currentChoice - 1])
        ],
      );
}

class DragObjectBox extends StatelessWidget {
  DragObjectBox(this.animal);
  final animal;
  @override
  Widget build(BuildContext context) => Draggable<Animal>(
        data: animal,
        child: buildImage(),
        feedback: buildImage(),
        childWhenDragging: buildDraging(),
      );
  Widget buildImage() => Container(
        width: 250,
        height: 160,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: mcl41,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              color: Colors.black12,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          color: mcl30,
          child: Center(
            child: Text(
              animal.name,
              style: TextStyle(fontSize: 45.0),
            ),
          ),
        ),
      );
  Widget buildDraging() => Container(
        color: mcl35,
      );
}
