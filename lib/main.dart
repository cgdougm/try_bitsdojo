import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyApp());

  doWhenWindowReady(() {
    // BitsDojo Window Settings
    appWindow.minSize = Size(320, 320);
    appWindow.size = Size(1280, 720);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WindowWidget(),
      ),
    );
  }
}


class WindowWidget extends StatelessWidget {
  const WindowWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 42, 36, 48),
                Color.fromARGB(255, 87, 115, 121)
              ],
              stops: [
                0.1,
                1.0
              ]),
        ),
        child: Column(children: [
          WindowTitleBarBox(
            child: Container(
              color: const Color.fromARGB(30, 0, 0, 0),
              child: Row(
                children: [
                  Expanded(
                    child: MoveWindow(
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(3, 0, 3, 2),
                        child: Row(children: [
                          IconButton(
                            icon: Icon(
                              Icons.menu_rounded,
                              color: Color.fromARGB(180, 157, 140, 217),
                              size: 18,
                            ),
                            onPressed: null,
                          ),
                          Baseline(
                            baseline: 22,
                            baselineType: TextBaseline.alphabetic,
                            child: Text("custom",
                                  style: TextStyle(
                                      fontFamily: 'HeptaSlab',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color.fromARGB(180, 157, 140, 217),
                                      letterSpacing: -1)),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.sunny,
                              color: Color.fromARGB(255, 88, 44, 209),
                              size: 15,
                            ),
                            onPressed: null,
                          ),
                        ]),
                      ),
                    ),
                  ),
                  const WindowButtons(),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

final buttonColors = WindowButtonColors(
    mouseOver: const Color.fromARGB(255, 117, 13, 245),
    mouseDown: const Color.fromARGB(255, 157, 140, 217),
    iconNormal: const Color.fromARGB(255, 88, 44, 209),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: buttonColors),
      ],
    );
  }
}
