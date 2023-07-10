import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowResultPage extends StatelessWidget {
  final int correctAnswerCount;
  final List<bool> answerResults;
  final List<Map<String, dynamic>> answeredQuestions;

  ShowResultPage({
    required this.correctAnswerCount,
    required this.answerResults,
    required this.answeredQuestions,
    required List<Map<String, dynamic>> questions,
  });

  String getResultMessage() {
    if (correctAnswerCount == 0) {
      return 'ハットリ助走';
    } else if (correctAnswerCount >= 1 && correctAnswerCount <= 3) {
      return 'ハットリ快走';
    } else if (correctAnswerCount == 4) {
      return 'ほぼハットリ完走';
    } else {
      return 'ハットリ完走';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 239, 219),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 239, 219),
            image: DecorationImage(
              image: AssetImage("assets/images/title.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Text(
                '$correctAnswerCount 問正解',
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'GLT',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'あなたは',
                style: TextStyle(fontFamily: 'Honoka', fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                getResultMessage(),
                style: TextStyle(
                    fontSize: 53,
                    fontFamily: 'GLT',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: answeredQuestions.length,
                  itemBuilder: (context, i) {
                    final isCorrect = answerResults[i];
                    final textColor = isCorrect
                        ? Color.fromARGB(255, 236, 68, 68)
                        : Color.fromARGB(255, 86, 97, 250);
                    final question = answeredQuestions[i]['question'];
                    final url = answeredQuestions[i]['url'];
                    return GestureDetector(
                      onTap: () async {
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            Text(
                              answerResults[i] ? '○' : '×',
                              style: TextStyle(fontSize: 30, color: textColor),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              question,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: textColor,
                                  fontFamily: 'Honoka',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '創造者:${answeredQuestions[i]['choices'][answeredQuestions[i]['answer']]}',
                              style: TextStyle(fontSize: 16, color: textColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '※名言タップで引用元に飛びます',
                  style: TextStyle(
                      fontFamily: 'GLT',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context,
                      ModalRoute.withName('/')); // Go back to the main page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 138, 78, 55).withOpacity(0.4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                child: Text(
                  '戻る',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
