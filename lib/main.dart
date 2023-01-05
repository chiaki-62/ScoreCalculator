import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '麻雀スコアボード',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: '麻雀スコアボード'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text = '';

  _addName(text) {
    debugPrint(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top:8,left:8,right:8),
            child: Column(
              children: const <Widget>[
                Card(
                  child: ListTile(
                    title: Text('_text'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('タマネギを買う'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('ジャガイモを買う'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('カレールーを買う'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top:16,left:16,right:16),
            child : TextFormField(
              onChanged: (value) {
                _text = value;
              },
              decoration: const InputDecoration(
                labelText: '名前',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child : ElevatedButton(
              onPressed: () {
                _addName(_text);
              },
              style: ElevatedButton.styleFrom(
                elevation: 16,
              ),
              child: const Text('メンバーを追加する'),
            ),
          ),
        ],
      ),
    );
  }
}
