import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  GoogleTranslator translator = new GoogleTranslator();

  String out;
  final lang = TextEditingController();

  void trans() {
    translator.translate(lang.text, to: 'vi').then((output) {
      setState(() {
        out =
            output.text; //placing the translated text to the String to be used
      });
      print(out);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Translate"),
      ),
      body: Container(
        child: Center(
            child: Column(
          children: <Widget>[
            TextField(
              controller: lang,
            ),
            RaisedButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Translate now",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                trans();
              },
            ),
            Text(out.toString()) //translated string
          ],
        )),
      ),
    );
  }
}
