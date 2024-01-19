import 'package:flutter/material.dart';
import 'package:json/screens/splashscreen.dart';
import 'package:json/screens/translationscreen.dart';
import 'package:json/themeprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool isDark = false;
  final ThemeData lighttheme = ThemeData(
    primaryColor: Color(0xFFE7A611),
    brightness: Brightness.dark,
    indicatorColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0XFFF5A623),
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
  final ThemeData darktheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.light,
    indicatorColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: Consumer<ThemeProvider>(builder: (context, providerios, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: providerios.theme == false ? lighttheme : darktheme,
          home: SplashScreen(),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
