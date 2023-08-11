import 'package:flutter/material.dart';

import './inputField.dart';
import './calculate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qalculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Qalculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  var answer = '', quadEqn = '';

  void displayAnswer() {
    var ansStr = '';
    int _a = int.parse(a.text);
    int _b = int.parse(b.text);
    int _c = int.parse(c.text);

    var ans = solveQuadratic(_a, _b, _c);

    if (ans == null) {
      ansStr = 'Root not exists';
    } else if (ans.length == 1) {
      ansStr =
          '\u03b1= ' + ans[0].toString() + '\n\u03b2= ' + ans[0].toString();
    } else if (ans.length == 2) {
      ansStr =
          '\u03b1= ' + ans[0].toString() + '\n\u03b2= ' + ans[1].toString();
    }

    var _quadEqn = '';
    if (_a == 1) {
      _quadEqn += 'x\u00B2 ';
    } else if (_a == -1) {
      _quadEqn += '-x\u00B2 ';
    } else if (_a != 0) {
      _quadEqn += _a.toString() + 'x\u00B2 ';
    }
    if (_b == 1) {
      _quadEqn += '+x ';
    } else if (_b == -1) {
      _quadEqn += '-x ';
    } else if (_b > 0) {
      _quadEqn += '+' + _b.toString() + 'x ';
    } else if (_b < 0) {
      _quadEqn += _b.toString() + 'x ';
    }
    if (_c < 0) {
      _quadEqn += _c.toString() + ' = 0';
    } else if (_c > 0) {
      _quadEqn += '+' + _c.toString() + ' = 0';
    } else {
      _quadEqn += ' = 0';
    }

    if (_a == 0) {
      _quadEqn = "'a' can not be equal to 0.";
      ansStr = '';
    }

    setState(() {
      answer = ansStr;
      quadEqn = _quadEqn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'ax\u00B2 + bx + c = 0',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InputField(
                    labelText: 'a',
                    controller: a,
                  ),
                  InputField(
                    labelText: 'b',
                    controller: b,
                  ),
                  InputField(
                    labelText: 'c',
                    controller: c,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Text(
                        quadEqn,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Text(
                      answer,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: displayAnswer,
        tooltip: 'Increment',
        child: Text(
          '=',
          style: TextStyle(fontSize: 30),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
