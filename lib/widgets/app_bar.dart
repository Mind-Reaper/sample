

   import 'package:flutter/material.dart';

 myBar(BuildContext context, {String title: 'Title', List<Widget> actions: const  []}) {
    return AppBar(
      title: Text(title),
      actions: actions
    );
  }

