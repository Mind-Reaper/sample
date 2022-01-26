import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/providers/state_provider.dart';
import 'package:sample/screens/sign_up.dart';
import 'package:sample/widgets/app_bar.dart';
import 'package:sample/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var stateProvider = Provider.of<StateProvider>(context);

    return Scaffold(
      appBar: myBar(context, title: 'SIGN IN'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              stateProvider.counter.toString(),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            RoundedButton(
              onPressed: () {
                stateProvider.increment();
              },
              title: 'Add',
              color: Colors.red,
            ),
            SizedBox(
              height: 20,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
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
