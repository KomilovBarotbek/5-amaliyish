import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(TextEncoderDecoderApp());
}

class TextEncoderDecoderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextEncoderDecoderScreen(),
    );
  }
}

class TextEncoderDecoderScreen extends StatefulWidget {
  @override
  _TextEncoderDecoderScreenState createState() =>
      _TextEncoderDecoderScreenState();
}

class _TextEncoderDecoderScreenState extends State<TextEncoderDecoderScreen> {
  TextEditingController _inputController = TextEditingController();
  String _outputText = "";
  String _decodedText = "";

  void _encodeText() {
    setState(() {
      String input = _inputController.text;
      _outputText = base64Encode(utf8.encode(input));
    });
  }

  void _decodeText() {
    setState(() {
      try {
        String input = _outputText.trim();
        _decodedText = utf8.decode(base64Decode(input));
      } catch (e) {
        _decodedText =
            "Xatolik: Dekodlashda xatolik yuz berdi!\nIltimos, to'g'ri Base64 matn kiriting.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matn Kodlash va Dekodlash"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                labelText: "Matnni kiriting",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _encodeText,
                  child: Text("Kodlash"),
                ),
                ElevatedButton(
                  onPressed: _decodeText,
                  child: Text("Dekodlash"),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Kodlangan natija:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Text(
                  _outputText,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Dekodlangan natija:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Text(
                  _decodedText,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
