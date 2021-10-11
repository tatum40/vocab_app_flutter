import 'package:flutter/material.dart';

class GadientText extends StatefulWidget {
  const GadientText({Key? key, required this.titleShow}) : super(key: key);

  final titleShow;

  @override
  _GadientTextState createState() => _GadientTextState();
}

class _GadientTextState extends State<GadientText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: ShaderMask(
        child: Stack(
          children: [
            Positioned(
                left: 3,
                top: 2,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.titleShow,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45.withOpacity(0.5),
                    ),
                  ),
                )),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                widget.titleShow,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        shaderCallback: (rect) {
          return LinearGradient(stops: [
            0.2,
            0.5,
            0.7,
            0.9
          ], colors: [
            Color(int.parse('0xffF38181')),
            Color(int.parse('0xfff7d76f')),
            Color(int.parse('0xffdcfcb3')),
            Color(int.parse('0xff95E1D3')),
          ]).createShader(rect);
        },
      ),
    );
  }
}
