import 'package:flutter/material.dart';
import 'app/pages/main_page.dart';
import 'app/question_brand.dart';

void main() => runApp(const MyApp());

QuestionBrain brand = QuestionBrain();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MainPage(),
    );
  }
}
