import 'package:flutter/material.dart';  //import material package to use Material Design widgets
import 'package:flutter/foundation.dart'; //import for debugPrint
//start flutter application
void main() {
  runApp(WordCounter()); //run the WordCounter widget
}
//definition of StatelessWidget which does not require mutable state/widget build the properties not changing
class WordCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MaterialApp widget
    return MaterialApp(
      title: 'Word Counter App', //title of the app
      theme: ThemeData(
        primarySwatch: Colors.green, //primary color theme
      ),
        home: WordCounterScreen(), //setting the home widget to WordCounterHomePage
    );
  }
}
//definition of  StatefulWidget maintain state that can change during lifetime
class WordCounterScreen extends StatefulWidget {
  @override
  _WordCounterScreenState createState() => _WordCounterScreenState(); //state for this widget
}
//contains logic and data for WordCounterScreenState
class _WordCounterScreenState extends State<WordCounterScreen> {
  final TextEditingController _controller = TextEditingController();//retrieve current text entered by user
  int _wordCount = 0; //hold the counting value

//counting method
  void _countWords() {
    final text = _controller.text; //retrieve the text from controller
    setState(() {
      //split the text by whitespace and filter out empty strings
      //\s stands for whitespace character; r - indicates that it is the row string literal; RedExp- regular expression for string pattern matching
      _wordCount = text.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Scaffold for the structure of the screen
      appBar: AppBar(
        title: Text('Word Counter Flutter'), //title in the app bar
      ),
      body: Padding( //container for better visual representation
        padding: const EdgeInsets.all(16.0), //around the main content
        child: Column(//vertical layout for widgets
          children: [
            TextField(
              controller: _controller, //connect the text field to the controller
              decoration: InputDecoration(
                labelText: 'Enter text', //text dispalyed when the label is empty
                border: UnderlineInputBorder(), //border style for the text field
              ),
              maxLines: 6, //text field max of 6 lines
            ),
            SizedBox(height: 11), //space between the text field and button
            ElevatedButton(
              onPressed: _countWords, //when pressed call the _countWords method
              child: Text('Count Words'), //the button
            ),
            SizedBox(height: 22), //space between the button and word count display
            Text('Word Count: $_wordCount'), //display word count
          ],
        ),
      ),
    );
  }
}

