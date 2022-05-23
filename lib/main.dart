import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/question_brand.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

QuestionBrain brand = QuestionBrain();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = brand.getCorrectAnswer();

    setState(() {
      if (brand.isFinished() == true) {
        Alert(
                context: context,
                title: 'Аяктады!',
                desc: 'Сиз тесттин аягына жеттиниз ...')
            .show();

        brand.reset();

        scoreKeeper.clear();
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
              size: 25.0,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
              size: 25.0,
            ),
          );
        }

        brand.getNextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Тапшырма 07',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              // margin: EdgeInsets.all(15),
              // padding: EdgeInsets.all(15),
              color: const Color.fromARGB(255, 39, 35, 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 8,
                    child: Center(
                        child: Text(
                      brand.getQuestionText(),
                      style: const TextStyle(fontSize: 25.0),
                    )),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () {
                        checkAnswer(true);
                      },
                      child: const Text(
                        'Туура',
                        style: TextStyle(fontSize: 28.0, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {
                        checkAnswer(false);
                      },
                      child: const Text(
                        'Туура эмес',
                        style: TextStyle(fontSize: 28.0, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: scoreKeeper,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
