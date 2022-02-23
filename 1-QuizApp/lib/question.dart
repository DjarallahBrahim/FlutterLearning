import 'package:flutter/widgets.dart';

class Question extends StatelessWidget {
  final String _questionText;

  Question(this._questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        _questionText,
        style: const TextStyle(
          fontSize: 28,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        textAlign: TextAlign.center,
      ),
      color: Color.fromARGB(255, 21, 168, 82),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
    );
  }
}
