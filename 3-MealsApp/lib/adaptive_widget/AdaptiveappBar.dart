import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final String title;
  final AppBar appBar;
  final List<Widget> widgets;
  final VoidCallback? actionHandler;
  final IconData? iconData;

  /// you can add more fields that meet your needs

  AdaptiveAppBar(this.title, this.appBar, this.widgets,
      [this.actionHandler, this.iconData = Icons.add]);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              title,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: actionHandler,
                  child: Icon(iconData),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text(
              title,
            ),
            actions: [
              IconButton(
                onPressed: actionHandler,
                icon: Icon(iconData),
              ),
            ],
          );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
