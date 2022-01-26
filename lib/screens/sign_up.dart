import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/providers/state_provider.dart';
import 'package:sample/screens/contact_screen.dart';
import 'package:sample/widgets/app_bar.dart';
import 'package:sample/widgets/button.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stateProvider = Provider.of<StateProvider>(context);
    return Scaffold(
      appBar: myBar(context, title: 'SIGN UP'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(stateProvider.counter.toString(), style: TextStyle(color: Colors.white),),
            SizedBox(height: 20,),
            RoundedButton(
              onPressed: () {
stateProvider.increment();
              },
              title: 'Add',
              color: Colors.red,

            ),

            SizedBox(height: 20,),
            RoundedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactScreen()));
              },
              title: 'Next',
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
