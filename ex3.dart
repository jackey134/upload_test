import 'package:animation_test/Tools/BouncyPageRoute.dart';
import 'package:animation_test/Tools/SlideRightRoute.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FirstScreen()));
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "First Screen",
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child: MaterialButton(
                color: Colors.deepOrange,
                child: Text(
                  "change1",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context, BouncyPageRoute(widget: SecondScreen()));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: MaterialButton(
                color: Colors.deepOrange,
                child: Text(
                  "change2",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context, SlideRightRoute(widget: SecondScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.black,
        child: const FractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.5,
        ),

      ),
    );
  }
}
