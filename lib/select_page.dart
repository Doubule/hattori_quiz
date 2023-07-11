import 'package:flutter/material.dart';
import 'package:hattori/hard_page.dart';
import 'package:hattori/quiz_page.dart';
import 'package:url_launcher/url_launcher.dart';

class select_page extends StatefulWidget {
  const select_page({super.key});

  @override
  State<select_page> createState() => _select_pageState();
}

final Uri _url = Uri.parse('https://pub.dev/packages/url_launcher');

class _select_pageState extends State<select_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 239, 219),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back3.jpg'), // 画像のパスを指定
                fit: BoxFit.cover, // 画像をウィジェットに合わせて表示
              ),
            ),
            child: Opacity(
              opacity: 0,
              child: Container(
                color: const Color.fromARGB(255, 239, 221, 178),
              ),
            ),
          ),
          const MainPageButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: const Text(
                      "－至極の名言の数々－",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 34,
                          fontFamily: 'Honoka',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 231, 162, 58)),
                    ),
                  ),
                  Container(
                    child: const Text(
                      "芸人ハットリ完走が創ったものか\n哲学者ニ–チェが創ったものかを\n当てていただくクイズアプリです",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 21,
                          fontFamily: 'Honoka',
                          height: 1.8,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 130,
                      ),
                      Text(
                        "ハットリ完走とは…\n出川哲朗・バカリズム・狩野英孝といった\n伝説的ピン芸人を育てたマセキ芸能社に\n所属する若手ピン芸人\n主著 『はじめてのふうぞく♪』",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            height: 1.8,
                            fontSize: 16,
                            fontFamily: 'SHU',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 160,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          const _url = 'https://note.com/htysmyhan/';
                          await launchUrl(_url);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fixedSize: const Size(70, 70),
                          backgroundColor:
                              const Color.fromARGB(255, 212, 255, 210)
                                  .withOpacity(0.6),
                        ),
                        child: const Text(
                          'note',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'SHU',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 65, 65, 65)),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          const _url =
                              'https://www.youtube.com/playlist?list=PLlxhsVYSJyr1FX_iKi1Bi8YBG8kZeRJIA';
                          await launchUrl(_url);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fixedSize: const Size(70, 70),
                          backgroundColor:
                              const Color.fromARGB(255, 232, 33, 33)
                                  .withOpacity(0.6),
                        ),
                        child: const Text('You\nTube',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'SHU',
                                height: 1.3,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 65, 65, 65)),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 170,
                      ),
                      Text(
                        "ニーチェとは…\nドイツの哲学者であり詩人\n人間は既存の価値を破壊し\n新たな価値を創り出す超人となるべき\nという実存主義を根本思想としていた\n主著『ツァラトゥストラはこう語った』",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            height: 2,
                            fontSize: 17,
                            fontFamily: 'SHU',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'ランダム５問クイズ',
                        style: TextStyle(
                            fontFamily: 'Honoka',
                            fontSize: 35,
                            color: Color.fromARGB(255, 7, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const quiz_page(
                                            answeredQuestions: [],
                                          )));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              fixedSize: const Size(130, 70),
                              backgroundColor:
                                  const Color.fromARGB(255, 212, 255, 210)
                                      .withOpacity(0.6),
                            ),
                            child: const Text(
                              '初級',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Honoka',
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 9, 6, 6)),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                            width: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const hard_page(
                                            answeredQuestions: [],
                                          )));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              fixedSize: const Size(130, 70),
                              backgroundColor:
                                  const Color.fromARGB(255, 232, 33, 33)
                                      .withOpacity(0.6),
                            ),
                            child: const Text(
                              '超上級',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Honoka',
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<bool> launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
    return true;
  } else {
    return false;
  }
}

Future<void> _launchUrl() async {
  const _url = 'https://note.com/htysmyhan/';
  const url2 =
      'https://www.youtube.com/playlist?list=PLlxhsVYSJyr1FX_iKi1Bi8YBG8kZeRJIA';

  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
