import 'package:bhagavd_gita/controller/chapters_provider.dart';
import 'package:bhagavd_gita/controller/theme_provider.dart';
import 'package:bhagavd_gita/view/splshscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key); // Corrected super call

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ChaptersProvider(), // Specifying the provider value
        ),
        ChangeNotifierProvider.value(
          value: ThemeProvider()..getTheme(), // Specifying the provider value
        ),
      ],
      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (context, tp, child) {
            return MaterialApp(
              home: SplashScreen(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: tp.thememode, // Assuming you have a variable called themeMode in your ThemeProvider
            );
          },
        );
      },
    );
  }
}
