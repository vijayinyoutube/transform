import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double translateX = 0.0;
  double translateY = 0.0;
  double scaleFactor = 1;
  double myAngle = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Transforms"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTranslate(),
            buildScale(),
            buildRotate(),
          ],
        ),
      ),
    );
  }

  Widget buildTranslate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.translate(
          offset: Offset(translateX, translateY),
          child: Icon(
            Icons.star,
            color: Colors.blue,
            size: 50,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.keyboard_arrow_up),
              color: Colors.blue,
              onPressed: () {
                translate(1);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    translate(4);
                  },
                ),
                SizedBox(
                  width: 25,
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_right),
                  color: Colors.blue,
                  onPressed: () {
                    translate(2);
                  },
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
              ),
              color: Colors.blue,
              onPressed: () {
                translate(3);
              },
            ),
          ],
        )
      ],
    );
  }

  translate(int i) {
    switch (i) {
      case 1:
        setState(() {
          translateY -= 10;
        });
        break;
      case 2:
        setState(() {
          translateX += 10;
        });
        break;
      case 3:
        setState(() {
          translateY += 10;
        });
        break;
      case 4:
        setState(() {
          translateX -= 10;
        });
        break;
      default:
        break;
    }
  }

  Widget buildScale() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: scaleFactor,
          child: Icon(
            Icons.star,
            color: Colors.green,
            size: 50,
          ),
        ),
        TextButton(
          child: Text(
            "Scale",
            style: TextStyle(color: Colors.green),
          ),
          onPressed: () {
            scale();
          },
        ),
      ],
    );
  }

  scale() async {
    for (var i = 0; i < 30; i++)
      await Future.delayed(Duration(milliseconds: 25), () {
        setState(() {
          scaleFactor += 0.1;
        });
      });
    for (var i = 0; i < 30; i++)
      await Future.delayed(Duration(milliseconds: 25), () {
        setState(() {
          scaleFactor -= 0.1;
        });
      });
  }

  Widget buildRotate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: myAngle,
          child: Icon(
            Icons.star,
            color: Colors.orange,
            size: 50,
          ),
        ),
        TextButton(
          child: Text(
            "Rotate",
            style: TextStyle(color: Colors.orange),
          ),
          onPressed: () {
            rotate();
          },
        ),
      ],
    );
  }

  rotate() async {
    for (var i = 0; i < 50; i++)
      await Future.delayed(Duration(milliseconds: 25), () {
        setState(() {
          myAngle += 0.1;
        });
      });
  }
}
