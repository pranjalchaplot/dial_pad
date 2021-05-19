import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trie/trie.dart';
import './widgets/DartButton.dart';

void main() {
  runApp(DialApp());
}

//DialPad

class DialApp extends StatefulWidget {
  const DialApp({Key key}) : super(key: key);

  @override
  DialAppState createState() => DialAppState();
}

class DialAppState extends State<DialApp> {
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void delete(String text) {
    setState(() {
      _expression = _expression.substring(0, _expression.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    Trie t = new Trie();
    List<String> users = [
      'Abhish',
      'Ajay',
      'Zenith',
      'Abba',
    ];
    for (int i = 0; i < users.length; i++) t.insert(users[i]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DialPad',
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: t
                      .search(_expression)
                      .map(
                        (i) => new Text(
                          i.toString(),
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DialButton(
                    text: '1',
                    letters: "",
                    callback: numClick,
                  ),
                  DialButton(
                    text: '2',
                    letters: "ABC",
                    callback: numClick,
                  ),
                  DialButton(
                    text: '3',
                    letters: "DEF",
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DialButton(
                    text: '4',
                    letters: "GHI",
                    callback: numClick,
                  ),
                  DialButton(
                    text: '5',
                    letters: "JKL",
                    callback: numClick,
                  ),
                  DialButton(
                    text: '6',
                    letters: "MNO",
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DialButton(
                    text: '7',
                    letters: "PQRS",
                    callback: numClick,
                  ),
                  DialButton(
                    text: '8',
                    letters: "TUV",
                    callback: numClick,
                  ),
                  DialButton(
                    text: '9',
                    letters: "WXYZ",
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DialButton(
                    text: '<',
                    letters: "",
                    callback: delete,
                  ),
                  DialButton(
                    text: '0',
                    letters: "",
                    callback: numClick,
                  ),
                  DialButton(
                    text: 'C',
                    letters: "",
                    callback: clear,
                    textSize: 26,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
