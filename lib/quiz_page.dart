import 'package:flutter/material.dart';
import 'package:hattori/show_result.dart';
import 'package:hattori/select_page.dart';

class quiz_page extends StatefulWidget {
  final List<Map<String, dynamic>> answeredQuestions; // 追加: 結果を受け取るためのリスト
  const quiz_page({Key? key, required this.answeredQuestions})
      : super(key: key);

  @override
  _quiz_pageState createState() => _quiz_pageState();
}

class _quiz_pageState extends State<quiz_page> {
  int currentQuestionIndex = 0;
  bool showResult = false;
  bool correctAnswer = false;
  int correctAnswerCount = 0;

  Map<String, dynamic>? currentQuestion;

  List<bool> answerResults = []; // 正誤結果を保持するリスト

  final List<Map<String, dynamic>> randomizedQuestions = [];

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'これだから\nオンライン街コン新参者は困る',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary': '街コンで最初に誰と話すか\n予約できるシステムのことを\n蔑ろにする人たちへのハットリさんの言葉',
      'quote': '「オンライン街コン」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/n6b099012a21a'
    },
    {
      'question': 'ハットリさんの邪魔になっちゃうから\nもう行こう！',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary': '気を遣われやすいハットリさん\n公園に集まっていた小学生へのネタ見せ後\n1人の小学生が彼に対して言い放った言葉',
      'quote': '「何かが伝わっている」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/nb8dc6c26bcf7'
    },
    {
      'question': 'この部屋も一回くらい\nセックス見たかったよなぁ‥',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary': '寮に入っていた頃,自分の部屋の元住人が\nヤリチンだったことを知ったときの\nハットリさんの気持ち',
      'quote': '「部屋」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/n83430aefef0f'
    },
    {
      'question': 'あぁ‥そうなんですね\nそれキュリオスって言うんですね',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary':
          '気に入られたい先輩との会話を盛り上げようと\n何とかボードゲームの話題に食いついたが\n嘘が露呈してしまった時に出た言葉',
      'quote': '「ボードゲーム好き」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/n7b84591dacc7'
    },
    {
      'question': '台本のないセックスがしたくて\nここにきたんだ',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary':
          'はじめてのふうぞくにて予定調和で\nありきたりな性行為に対して様々なことを悟り\n自問自答した後のハットリさんの気持ち',
      'quote': '20210213「はじめてのふうぞく♪」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/ncf1791c31f33'
    },
  ];

  List<int> createRandomQuestionIndices(int length) {
    final List<int> indices = List.generate(length, (index) => index);
    indices.shuffle();
    return indices;
  }

  List<Map<String, dynamic>> createRandomizedQuestions() {
    final List<int> indices = createRandomQuestionIndices(questions.length);
    return indices.map((index) => questions[index]).toList();
  }

  List<Map<String, dynamic>> answeredQuestions = []; // ユーザーが回答した質問を保持するリスト

  void checkAnswer(int answer) {
    setState(() {
      showResult = true;
      correctAnswer =
          answer == randomizedQuestions[currentQuestionIndex]['answer'];

      // 正誤結果をanswerResultsリストに追加
      answerResults.add(correctAnswer);

      if (correctAnswer) {
        correctAnswerCount++; // 正解の場合、正解数をインクリメント
      }

      // ユーザーが回答した質問をansweredQuestionsリストに追加
      answeredQuestions.add(randomizedQuestions[currentQuestionIndex]);
    });
  }

  void showResultPage(BuildContext context) {
    List<Map<String, dynamic>> answeredQuestionsCopy =
        List<Map<String, dynamic>>.from(answeredQuestions);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShowResultPage(
          correctAnswerCount: correctAnswerCount,
          questions: questions,
          answerResults: answerResults,
          answeredQuestions: answeredQuestionsCopy,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    randomizedQuestions.addAll(createRandomizedQuestions());
    currentQuestionIndex = 0; // インデックスを初期化する
    currentQuestion = randomizedQuestions[currentQuestionIndex];
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = randomizedQuestions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 239, 219),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Back.jpg'), // 画像のパスを指定
                fit: BoxFit.cover, // 画像をウィジェットに合わせて表示
              ),
            ),
            child: Opacity(
              opacity: 0.5,
              child: Container(
                color: const Color.fromARGB(255, 239, 221, 178),
              ),
            ),
          ),
          const MainPageButton(), // メインページに戻るボタン
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${currentQuestionIndex + 1}/5',
                  style: const TextStyle(
                    fontSize: 30,
                    fontFamily: 'GLT',
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 32, 251, 76).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 380,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            currentQuestion['question'],
                            style: const TextStyle(
                                fontSize: 26,
                                fontFamily: 'Honoka',
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'この言葉を生み出したのは',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'GLT',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 25),
                Column(
                  children: currentQuestion['choices']
                      .asMap()
                      .entries
                      .map<Widget>(
                        (entry) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: entry.key % 2 == 0
                                ? MainAxisAlignment.start // 左揃え
                                : MainAxisAlignment.end, // 右揃え
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize: const Size(150, 60),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.6),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  checkAnswer(entry.key);
                                },
                                child: Text(
                                  entry.value,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Honoka',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                ' \nか', // 表示したいテキストを指定
                                style: TextStyle(
                                  height: 1.1,
                                  fontSize: 30,
                                  fontFamily: 'Honoka',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 0),
                if (showResult)
                  Container(
                    width: 380,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          correctAnswer ? '正解！' : '不正解だね',
                          style: TextStyle(
                            fontSize: 29,
                            fontFamily: 'Honoka',
                            color: correctAnswer
                                ? const Color.fromARGB(255, 228, 58, 58)
                                : const Color.fromARGB(255, 54, 92, 244),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            currentQuestion['commentary'],
                            style: const TextStyle(
                              fontSize: 18.5,
                              fontFamily: 'Honoka',
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          currentQuestion['quote'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Honoka',
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size(90, 80),
                            backgroundColor: Color.fromARGB(255, 32, 251, 76)
                                .withOpacity(0.3),
                            elevation: 0,
                          ),
                          onPressed: () {
                            setState(() {
                              if (currentQuestionIndex <
                                  randomizedQuestions.length - 1) {
                                currentQuestionIndex++;
                                showResult = false;
                              } else {
                                showResultPage(
                                    context); // 2. showResultPageを呼び出す
                              }
                            });
                          },
                          child: const Text(
                            '→',
                            style: TextStyle(
                                fontSize: 50,
                                fontFamily: 'Honoka',
                                color: Color.fromARGB(180, 0, 0, 0),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainPageButton extends StatelessWidget {
  const MainPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -5,
      top: 35,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              const Color.fromARGB(95, 234, 234, 234).withOpacity(0.4),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(12),
        ),
        onPressed: () {
          Navigator.pop(context); // メインページに戻る
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: quiz_page(
        answeredQuestions: [],
      ),
    );
  }
}
