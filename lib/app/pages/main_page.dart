import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../main.dart';
import '../constants/string/app_text.dart';
import '../widgets/app_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final string = AppString.instance;
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = brand.getCorrectAnswer();

    setState(
      () {
        if (brand.isFinished() == true) {
          Alert(
                  context: context,
                  title: string.finished,
                  desc: string.finishedTest)
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    final string = AppString.instance;
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        string.appBarTitle,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
      ),
    );
  }

  Column _body() {
    final string = AppString.instance;
    return Column(
      children: [
        Expanded(
          child: Container(
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
                    ),
                  ),
                ),
                ElevatedBtn(
                  text: string.buttonTrue,
                  onPressed: () => checkAnswer(true),
                  color: MaterialStateProperty.all<Color>(Colors.green),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ElevatedBtn(
                  text: string.buttonFalse,
                  onPressed: () => checkAnswer(false),
                  color: MaterialStateProperty.all<Color>(Colors.red),
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
    );
  }
}
