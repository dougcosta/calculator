import 'package:flutter/material.dart';
import 'button.dart';
import 'button_row.dart';

class Keyboard extends StatelessWidget {

  final void Function(String) callback;

  Keyboard(this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          ButtonRow([
            Button.big(text: 'AC', callback: this.callback, color: Button.DARK),
            Button(text: '%', callback: this.callback, color: Button.DARK),
            Button.operation(text: '/', callback: this.callback),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(text: '7', callback: this.callback),
            Button(text: '8', callback: this.callback),
            Button(text: '9', callback: this.callback),
            Button.operation(text: 'x', callback: this.callback),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(text: '4', callback: this.callback),
            Button(text: '5', callback: this.callback),
            Button(text: '6', callback: this.callback),            
            Button.operation(text: '-', callback: this.callback),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(text: '1', callback: this.callback),
            Button(text: '2', callback: this.callback),
            Button(text: '3', callback: this.callback),
            Button.operation(text: '+', callback: this.callback),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button.big(text: '0', callback: this.callback),
            Button(text: ',', callback: this.callback),
            Button.operation(text: '=', callback: this.callback)
          ]),
        ],
      ),
    );
  }
}