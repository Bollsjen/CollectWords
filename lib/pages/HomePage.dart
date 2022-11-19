import 'package:flutter/material.dart';
import 'package:collect_words/components/collect_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final textController = TextEditingController();
  String showText = "";
  final _words = List.empty(growable: true);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Collect Words'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Type word here...'
              ),
              controller: textController,
            ),
          ),
          CollectButton(title: 'SAVE WORD', color: Colors.blue[400], function: SaveWord),
          CollectButton(title: 'CLEAR WORDS', color: Colors.blue[400], function: ClearWords),
          CollectButton(title: 'SHOW WORDS', color: Colors.blue[400], function: ShowWords),
          Text(
            showText,
          )
        ],
      ),
    );
  }

  void SaveWord(){
    _words.add(textController.text);
  }

  void ClearWords(){
    _words.clear();
  }

  void ShowWords(){
    setState(() {
      showText = _words.toString();
    });
  }
}