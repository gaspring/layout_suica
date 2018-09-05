import 'package:flutter/material.dart';

// Uncomment lines 7 and 10 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _myApp createState() => new _myApp();
}

class _myApp extends State<MyApp> {
  List<IconData> list = new List();

  @override
  Widget build(BuildContext context) {
    list.add(Icons.turned_in_not);
    list.add(Icons.translate);
    list.add(Icons.share);
    list.add(Icons.star);

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new IconButton(
            onPressed: () {
              if (list[3] == Icons.star) {
                setState(() {
                  list[3] = Icons.star_border;
                });
              } else {
                setState(() {
                  list[3] = Icons.star;
                });
              }
            },
            icon: new Icon(list[3], color: Colors.deepPurpleAccent),
          ),
          Text('41'),
        ],
      ),
    );

    Column buildButtonColumn(
        int index, IconData icon, IconData troca, String label,
        {bool ativo: true}) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              if (ativo) {
                if (list[index] == icon) {
                  setState(() {
                    list[index] = troca;
                  });
                } else {
                  setState(() {
                    list[index] = icon;
                  });
                }
              }
            },
            icon: new Icon(list[index], color: Colors.deepPurpleAccent),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
    }

//  Widget buttonSection - Container ***********************************
    //  child: Row
    //*************************************//

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(0, Icons.turned_in_not, Icons.turned_in, 'SAVE'),
          buildButtonColumn(1, Icons.translate, Icons.g_translate, 'TRANSLATE',
              ativo: true),
          buildButtonColumn(2, Icons.share, Icons.screen_share, 'SHARE',
              ativo: true),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 
1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola 
ride from Kandersteg, followed by a half-hour walk through pastures and pine 
forest, leads you to the lake, which warms to 20 degrees Celsius in the summer.
 Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text('Top Lakes'),
        ),
        body: ListView(
          children: [
            Image.asset(
              "assets/lake.jpg",
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
