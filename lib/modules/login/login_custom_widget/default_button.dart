

import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {



  final Function function;
  final String text;


  const DefaultButton({this.function, this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          3,
        ),
        color: Colors.purple,
      ),
    );
  }
}
