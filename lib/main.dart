import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:it_nobel/UI/home_page.dart';
import 'package:it_nobel/UI/landing_page.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'IT NOBEL',
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: LandingPage(),
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/HomePage':
                  return PageTransition(
                      child: HomePage(),
                      type: PageTransitionType.rightToLeft,
                      duration: const Duration(seconds: 2));
                  break;
                case '/LandingPage':
                  // ignore: always_specify_types
                  return PageTransition(
                      child: LandingPage(),
                      type: PageTransitionType.rightToLeft,
                      duration: const Duration(seconds: 2));
                  break;
                default:
                  // ignore: always_specify_types
                  return PageTransition(
                      child: HomePage(),
                      type: PageTransitionType.scale,
                      duration: const Duration(seconds: 2));
              }
            },
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
