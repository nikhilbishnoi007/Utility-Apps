import 'package:flutter/material.dart';

class AnimateScreen extends StatefulWidget {
  const AnimateScreen({super.key});
  @override
  State<AnimateScreen> createState() => _AnimateScreenState();
}

class _AnimateScreenState extends State<AnimateScreen> {
  var _width = 200.0;
  var _height = 100.0;
  var _opacity=1.0;
  var mydecor = BoxDecoration(
    borderRadius: BorderRadius.circular(21),
    color: Colors.blueGrey,
  );
  bool flag = false;
  void togle() {
    setState(() {
      flag = !flag;
      if (flag) {
        _width = 200.0;
        _height = 200.0;
        _opacity=0.1;
        mydecor = BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(21),
        );
      } else {
        _width = 200.0;
        _height = 100.0;
        _opacity=1.0;
        mydecor = BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: Colors.blueGrey,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 238, 240),
        title: Text("Animate Screen"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Align(
            alignment: .center,
            child: AnimatedContainer(
              margin: EdgeInsets.all(10),
              width: _width,
              height: _height,
              decoration: mydecor,
              curve:Curves.fastEaseInToSlowEaseOut,
              duration: Duration(seconds: 2),
            ),
          ),
          Center(
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(onPressed:togle, child: Text("Animated")),
            ),
          ),
        Align(
          alignment: .center,
          child: AnimatedOpacity(
            opacity: _opacity, 
            duration: Duration(seconds: 2),
            child: Container(
              margin: EdgeInsets.all(10),
              width: 200,
              height: 200,
              decoration: mydecor,
            ),
            ),
        )
        ],
      ),
    );
  }
}
