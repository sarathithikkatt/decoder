import 'package:decoder/decoder/base64.dart';
import 'package:decoder/render.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final inputTextController = TextEditingController();
  var decodedOutput = "Decoded Result will be available here";

  @override
  void dispose() {
    inputTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        // divide into two rows
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          // left side
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height / 2.4,
                  width: width / 2.5,
                  child: TextField(
                    controller: inputTextController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Enter base64 here',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      var base64 = inputTextController.text;
                      decodedOutput = decodeBase64String(base64);
                      setState(() {});
                    },
                    child: Icon(Icons.play_circle))
              ],
            ),
          ),
          SizedBox(
            child: Container(
              color: Colors.black,
              width: 0.5,
            ),
          ),
          // right sides
          RenderWidget(renderText: decodedOutput)
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("Clear"),
          onPressed: () {
            inputTextController.clear();
            setState(() {});
          }),
    );
  }
}
