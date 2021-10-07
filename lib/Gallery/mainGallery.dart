// import 'package:flutter/material.dart';
// import 'package:vocab_app/content/contentData.dart';
// import 'package:vocab_app/theme/color.dart';

// class MainGallery extends StatefulWidget {
//   const MainGallery({Key? key}) : super(key: key);

//   @override
//   _MainGalleryState createState() => _MainGalleryState();
// }

// class _MainGalleryState extends State<MainGallery> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Gallery Vocabuly'),
//           centerTitle: true,
//         ),
//         body: ListView.builder(
//           padding: const EdgeInsets.all(8),
//           itemCount: allGallery.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               margin: EdgeInsets.symmetric(vertical: 10.0),
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                 color: mcl35,
//                 boxShadow: [
//                   BoxShadow(
//                     spreadRadius: 2,
//                     blurRadius: 4,
//                     color: Colors.black38,
//                     offset: Offset(1, 0),
//                   ),
//                 ],
//               ),
//               width: MediaQuery.of(context).size.width * 1,
//               child: MaterialButton(
//                 onPressed: () => () {},
//                 child: Text(
//                   allGallery[index].titleName,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
