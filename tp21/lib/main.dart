import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp21/data/quizdataset.dart';
import 'package:tp21/provider/quizprovider.dart';
import 'package:tp21/views/quizmainpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ChangeNotifierProvider(
        create: (_) => QuizProvider(0, getQuizzes()),
        child: HomePage(title: "Quiz"),
      ),
    );
  }
}
