import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key ? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 89, 255),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            _openAnimatedDialog(context);
          },
          height: 50,
          minWidth: 200,          
          color: const Color.fromARGB(255, 1, 21, 102),
            child: const Text(
              'FLUTTER ANIMATED DIALOG',
              style: TextStyle(
                color: Colors.white
              ),
            ),
        ),
      ),
    );
  }

  void _openAnimatedDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder:(context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, animation1, animation2, widget){
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation1),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation1),
            child: AlertDialog(
              title: const Text('Hello'),
              content: const Text('Iam An a Flutter Animated Dialog'),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        );
      }
    );
  }
}


