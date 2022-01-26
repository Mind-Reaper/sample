import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
 final String title;
 final VoidCallback? onPressed;
 final Color color;

  const RoundedButton({Key? key, this.title: 'Continue', this.onPressed, this.color: Colors.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
      elevation: 5,
      color: color,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      height: 50,
      minWidth: 120,
      child: Text(title, style: TextStyle(color: Colors.white),),
    );
  }
}