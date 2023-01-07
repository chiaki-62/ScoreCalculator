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
  // テキストフィールドを管理するコントローラを作成(入力内容の取得用)
  final textController = TextEditingController();

  // 入力データ格納用のリスト
  List<Map<String, dynamic>> items = [];

  //　追加ボタンが押されたときの処理（リストにIDと入力データを新規追加）
  void _addItem(String inputText) {
    setState(() {
      items.add({ "content": inputText});
    });
  }
  
  @override
  // widgetの破棄時にコントローラも破棄
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: textController,
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
                //テキストフィールドの内容を取得し、アイテムリストに追加
                _addItem(textController.text);

                // テキストフィールドの内容をクリア
                textController.clear();
              },
              child: const Text('メンバーを追加する'),
            ),
          ),
          Expanded(
            child:ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                // 新しいカードを作成して返す
                return Dismissible(
                  key: UniqueKey(),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromARGB(255, 85, 85, 85),
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(item["content"]),
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.only(
                      right: 16,
                    ),
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child : ElevatedButton(
              onPressed: () {
                //テキストフィールドの内容を取得し、アイテムリストに追加
                _addItem(textController.text);

                // テキストフィールドの内容をクリア
                textController.clear();
              },
              child: const Text('スコアを入力する'),
            ),
          ),
        ]
      ),
    );
  }
}
