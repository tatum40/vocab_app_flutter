import 'package:flutter/material.dart';
import 'package:vocab_app/content/contentData.dart';
import 'package:vocab_app/widget/GadientText_widget.dart';
import 'package:vocab_app/Gallery/gallery.dart';

class MainGallery extends StatefulWidget {
  const MainGallery({Key? key}) : super(key: key);

  @override
  _MainGalleryState createState() => _MainGalleryState();
}

class _MainGalleryState extends State<MainGallery> {
  void _toGamePage(context, gamePage) {
    if (gamePage == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Gallery(galleryType: 'animal')),
      );
    } else if (gamePage == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Gallery(galleryType: 'fruit')),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Gallery(galleryType: 'food')),
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
                titleShow: 'Gallery',
              ),
              for (var i = 0; i < allGalleryTitle.length; i++)
                _buildButtonGame(context, allGalleryTitle[i].title, i),
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
