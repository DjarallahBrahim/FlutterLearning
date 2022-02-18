import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback _restartPlay;
  Result(this.resultScore, this._restartPlay);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'You are awsome';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore < 16) {
      resultText = ('You are so bad!');
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: _restartPlay,
            child: Text("Restart Quiz!"),
          )
        ],
      ),
    );
  }
}
