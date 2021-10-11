import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vocab_app/content/contentData.dart';
import 'package:vocab_app/home.dart';
import 'package:vocab_app/theme/color.dart';

class SpellingBee extends StatefulWidget {
  const SpellingBee({Key? key}) : super(key: key);

  @override
  _SpellingBeeState createState() => _SpellingBeeState();
}

class _SpellingBeeState extends State<SpellingBee> {
  int currentChoice = 1;

  List listShow = allDataInGallery.where((i) => i.type == 'food').toList();
  List shuffleName = [];
  List answerVocab = [];

  @override
  void initState() {
    super.initState();
    getShuffleName();
  }

  void getShuffleName() {
    List shuffle = listShow[currentChoice - 1].name.split('');
    shuffle.shuffle();
    setState(() {
      shuffleName = shuffle;
    });
  }

  void _getNameSpell(data) {
    setState(() {
      if (answerVocab.length != shuffleName.length) {
        answerVocab.add(data);
      }
    });

    print(answerVocab);
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
          percent: currentChoice / 5,
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Text(
                    'Spelling Bee.',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  width: 200,
                  height: 300,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    border: Border.all(width: 2),
                  ),
                  child: Image.asset(listShow[currentChoice - 1].img),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25.0),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (var i = 0; i < listShow[currentChoice-1].name.length; i++)
                        _buildTarget()
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (var i = 0; i < shuffleName.length; i++)
                      DragCharacter(shuffleName[i]),
                  ],
                )
              ],
            ),
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
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide.none,
                  top: BorderSide.none,
                  right: BorderSide.none,
                  bottom: BorderSide(width: 2, color: Colors.black),
                ),
              ),
              width: 45,
              height: 45,
            ),
          );
        },
        onAccept: (data) {
          _getNameSpell(data);
        },
      );
}

class DragCharacter extends StatelessWidget {
  DragCharacter(this.shuffleName);
  final shuffleName;
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Draggable(
          data: shuffleName,
          child: _buildImg(shuffleName),
          feedback: _buildImg(shuffleName),
          childWhenDragging: _buildChild(),
        ),
      );

  Widget _buildImg(food) => Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(width: 2),
        ),
        width: 45,
        height: 60,
        child: Center(
          child: Text(
            shuffleName,
            style: TextStyle(color: Colors.black),
          ),
        ),
      );

  Widget _buildChild() => Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(width: 2),
        ),
        width: 45,
        height: 60,
      );
}
