import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Magic8Ball(),
      ),
    );

class Magic8Ball extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "Ask Me Anything",
          style: TextStyle(
            fontFamily: 'Pacifico',
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue,
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballPic = 1;

  var list = [
    "YES",
    "NO",
    "ASK AGAIN LATER",
    "THE ANSWER IS YES",
    "I HAVE NO IDEA"
  ];

  void changePic() {
    setState(() {
      ballPic = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          setState(() {
            changePic();
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Text(
                  list[ballPic-1],
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Image.asset('images/ball$ballPic.png'),
          ],
        ),
      ),
    );
  }
}
