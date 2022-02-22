
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String _text;
  final Function _iosHandler;
  final Function _androidHandler;
  final Function _optionalHandler;

  AdaptiveFlatButton(this._text, this._iosHandler, this._androidHandler,
      this._optionalHandler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              _text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => _iosHandler(_optionalHandler),
          )
        : TextButton(
            child: Text(
              _text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => _androidHandler(_optionalHandler),
          );
  }
}
