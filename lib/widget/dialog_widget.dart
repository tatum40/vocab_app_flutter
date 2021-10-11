import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:vocab_app/content/contentData.dart';
import 'package:vocab_app/theme/color.dart';

class DialogAnswer extends StatefulWidget {
  const DialogAnswer(
      {Key? key,
      required this.isCorrect,
      required this.data,
      required this.nextChoice,
      required this.currentChoice})
      : super(key: key);

  final isCorrect;
  final data;
  final currentChoice;
  final Function nextChoice;

  @override
  _DialogAnswerState createState() => _DialogAnswerState();
}

class _DialogAnswerState extends State<DialogAnswer> {
  bool isSpeaking = false;

  List dataList = [];

  final _flutterTts = FlutterTts();

  void initializeTts() {
    _flutterTts.setStartHandler(() {
      setState(() {
        isSpeaking = true;
      });
    });
    _flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });
    _flutterTts.setErrorHandler((message) {
      setState(() {
        isSpeaking = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initializeTts();

    setState(() {
      if (widget.data == 'fruit') {
        dataList = sentenceExercise;
      } else {
        dataList = allAnimals;
      }
    });
  }

  void speakVocab(vocab) async {
    if (vocab != null) {
      await _flutterTts.setLanguage('en-Us');
      await _flutterTts.speak(vocab);
    }
    print(vocab);
  }

  void speakSubtitle(subtitle) async {
    await _flutterTts.setLanguage('th-TH');
    await _flutterTts.speak(subtitle);
    print(subtitle);
  }

  void stop() async {
    await _flutterTts.stop();
    setState(() {
      isSpeaking = false;
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      title: _buildTitle(),
      content: Container(
        height: 280,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                color: mcl41,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Image.asset(dataList[widget.currentChoice - 1].correctImg),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                dataList[widget.currentChoice - 1].name,
                style: TextStyle(fontSize: 30, color: mcl42),
              ),
            ),
            Container(
              child: Text(
                dataList[widget.currentChoice - 1].subtitle +
                    " , " +
                    dataList[widget.currentChoice - 1].pos,
                style: TextStyle(fontSize: 20),
              ),
            ),
            _buildBottomMenu()
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 2, color: widget.isCorrect ? mcl3 : mcl36)),
            child: Icon(
              widget.isCorrect ? Icons.done : Icons.close,
              color: widget.isCorrect ? mcl3 : mcl36,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              widget.isCorrect ? 'เก่งมาก' : 'ผิดจ้า',
              style: TextStyle(color: widget.isCorrect ? mcl3 : mcl36),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomMenu() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            child: MaterialButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () =>
                  speakVocab(dataList[widget.currentChoice - 1].name),
              child: Icon(Icons.volume_up),
              shape: CircleBorder(side: BorderSide(width: 1)),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            child: MaterialButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () =>
                  speakSubtitle(dataList[widget.currentChoice - 1].subtitle),
              child: Icon(Icons.hearing),
              shape: CircleBorder(side: BorderSide(width: 1)),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            child: MaterialButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () => widget.nextChoice(),
              child: Icon(Icons.arrow_forward),
              shape: CircleBorder(side: BorderSide(width: 1)),
            ),
          )
        ],
      ),
    );
  }
}
