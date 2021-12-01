import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future signInWithGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
          clientId:
              '322207213137-cvgp571jun8ufigpnjac6ghol657v4v2.apps.googleusercontent.com');

      print(_googleSignIn.clientId);
      GoogleSignInAccount? login = await _googleSignIn.signIn();
      print(login!.email);
      login.authentication.then((value) {
        String? token = value.idToken;
        print(token);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: signInWithGoogle,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
