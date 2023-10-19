import 'package:decoder/decoder/base64.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final inputTextController = TextEditingController();

  @override
  void dispose() {
    inputTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String html = "WILL DO SOMETHING HERE LATER";
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
                      print("PRESSED BUTTON");
                      var base64 = inputTextController.text;
                      setState(() {
                        html = decodeBase64String(base64);
                        print("NEW HTML :" + html);
                      });
                    },
                    child: Icon(Icons.play_circle))
              ],
            ),
          ),
          // right sides
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height / 2.4,
              width: width / 2.5,
              child: Text(html),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: () {
            print("PRESSED Floating button");
            inputTextController.clear();
          }),
    );
  }
}
