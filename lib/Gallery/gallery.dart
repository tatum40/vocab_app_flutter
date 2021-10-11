import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:vocab_app/content/contentData.dart';
import 'package:vocab_app/theme/color.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key, required this.galleryType}) : super(key: key);

  final galleryType;

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  bool isSpeaking = false;

  List newList = [];

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
      newList = allDataInGallery
        .where((i) => i.type == widget.galleryType.toString())
        .toList();
    });
    
  }

  void speakVocab(vocab) async {
    if (vocab != null) {
      await _flutterTts.speak(vocab);
    }
    print(vocab);
  }

  void speakDetail(detail) async {
    await _flutterTts.speak(detail);
    print(detail);
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text('Vocabulary Gallery'),
          centerTitle: true,
        ),
        body: Container(
          child: GridView.count(
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            children: <Widget>[
              for (var i = 0; i < newList.length; i++)
                MaterialButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  onPressed: () => dialogVocab(context, newList[i]),
                  child: Container(
                    width: 158,
                    height: 158,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          newList[i].img,
                          width: 100,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.0),
                          child: Text(
                            newList[i].name,
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void dialogVocab(context, detail) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        actions: <Widget>[
          Center(
            child: Container(
              width: 300,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    width: 150,
                    child: Image.asset(
                      detail.img,
                      width: 100,
                    ),
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
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 5.0),
                      child: Text(
                        detail.name,
                        style: TextStyle(fontSize: 30, color: mcl42),
                      )),
                  Container(
                    child: Text(
                      detail.subtitle + " , " + detail.pos,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    width: 300,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Text(
                      detail.detail,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          width: 50,
                          height: 50,
                          child: MaterialButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () => !isSpeaking
                                ? speakVocab(detail.name)
                                : stop(),
                            child: Icon(Icons.volume_up),
                            shape: CircleBorder(side: BorderSide(width: 2)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          width: 50,
                          height: 50,
                          child: MaterialButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () => !isSpeaking
                                ? speakDetail(detail.detail)
                                : stop(),
                            child: Icon(Icons.hearing),
                            shape: CircleBorder(side: BorderSide(width: 2)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
