import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp21/provider/quizprovider.dart';

class HomePage extends StatelessWidget {

  HomePage({Key? key, String? title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<QuizProvider>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
              "Quiz",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400
              )
          ), centerTitle: true
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  color: Colors.white,
                  child: Image.asset(_provider.quizzes[_provider.index].getImage()),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: Text(
                _provider.quizzes[_provider.index].getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                          ),
                          onPressed: () {
                          if (_provider.quizzes[_provider.index].answer == "True") {
                            ScaffoldMessenger.of(context).showSnackBar(_provider.correctAnswer());
                            _provider.nextQuiz();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(_provider.wrongAnswer());
                          }
                         },
                          child: const Text(
                            "True",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),
                    )),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_provider.quizzes[_provider.index].answer == "False") {
                            ScaffoldMessenger.of(context).showSnackBar(_provider.correctAnswer());
                            _provider.nextQuiz();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(_provider.wrongAnswer());
                          }
                        },
                        child: const Text(
                          "False",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400
                          ),
                          textAlign: TextAlign.center,
                        )
                    )
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _provider.nextQuiz();
                      },
                      child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white
                      ),
                    ),
                  ),
                )
              ],
            )
            ),],
        ),
      ),
    );
  }
}
