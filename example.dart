import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  //设置了一个初始状态。
  late AnimationStatus animationStatus = AnimationStatus.reverse;
  late double animationValue = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        setState(() {
          animationStatus = status;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            //点击监听
            GestureDetector(
              onTap: () {
                //重置动画
                controller.reset();
                //动画开始
                controller.forward();
              },
              child: Text(
                'Start',
                textDirection: TextDirection.ltr,
              ),
            ),
            Text('State:' + animationStatus.toString(),
                textDirection: TextDirection.ltr),
            Text('Value:' + animationValue.toString(),
                textDirection: TextDirection.ltr),
            //图片小到大的容器，动态设置大小
            Container(
              height: animation.value,
              width: animation.value,
              child: FlutterLogo(),
            )
          ],
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}