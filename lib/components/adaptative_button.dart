import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            child: CupertinoButton(
              child: Text(label),
              onPressed: onPressed(),
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: onPressed(),
            child: Text(label),
          );
  }
}
