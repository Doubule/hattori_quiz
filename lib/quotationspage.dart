import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class QuotationsPage extends StatelessWidget {
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
    {
      'question': 'アンデス山脈中腹で\nたった今餓死した狐に\n誰が言葉を与える？',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary':
          '人生初風俗店で質問された内容を勘違いし\n見当はずれの答えをしたハットリさん\n己の行為を恥じたが吹っ切れる\nその状況を餓死した狐に例えた秀逸な表現',
      'quote': '20210129「はじめてのふうぞく♪」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/n92fbcd78a3f2'
    },
    {
      'question': 'すべては徐々に遷移していく\n若干の変化を伴いながら\n少しずつ少しずつ人は変化していく',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary': '初めて生でおっぱいを見た時に\n感情があまり変化しなかったことから\nハットリさんが感じ取ったこと',
      'quote': '20210205「はじめてのふうぞく♪」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/nbe01354a2a13'
    },
    {
      'question': '形あるものが一瞬にして\n崩れ落ちるその瞬間こそ\nそのものが形あった時以上に美しい',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary':
          '25年間の童貞生活の果てに\n築き上げられたプライドが\n女性の乳房で己を窒息させる行為によって\n崩れ去る寸前のハットリさんの考え',
      'quote': '20210502「the first soap」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/ne4598c0dfe8f'
    },
    {
      'question': '与えれた役目があるならば\nそれ以上でもそれ以下でもなく\nその役目としての仕事をすることが\n求められる。',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary':
          '部活動紹介で予期せぬ展開から\n主役級の役を貰えそうになるが\n女子からの冷たい苦言でその状況を\n真っ向否定されたハットリさんに浮かんだ考え',
      'quote': '「自分の役目」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/n92fbcd78a3f2'
    },
    {
      'question': '土壇場に立たされれば\n手近な幸せに手を伸ばすような奴は\n何したってうまくいかない',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary':
          '風俗か自慰行為かで悩むハットリさんが\n風俗サイトの写真を見て興奮してしまい\n耐えきれず部屋で自慰行為\nその後,自責の念に駆られて浮かんだ考え',
      'quote': '「風俗日和」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/n3fb0d25bda04'
    },
    {
      'question': '表情は言語を超越する',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary':
          '異国にて男の子が「ワンダーランド」と\nハットリさんに唱え続けてしまう。\n困った表情を周りの外国人に向けると\nそれだけで何かが伝わった時に浮かんだ考え',
      'quote': '「わんだーらんど」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/n7fd373a7c7d4'
    },
    {
      'question': '人間は経験したものの中だけで\n世界を構築する',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary':
          '深夜3時半に正常位の研究をするハットリさん\nうつ伏せの体勢をとった際に\n部活の体幹トレーニングを思い出してしまう\nその時ハットリさんに浮かんだ考え',
      'quote': '「正常位のやり方」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/neb09cf754c0d'
    },
    {
      'question': '人間の記憶に残るのは\n求めているものではない\n求めている時点で想像の範疇なのだ',
      'choices': ['ハットリ', 'ニーチェ'],
      'answer': 0,
      'commentary':
          'AVで尿道バイブを見たハットリさん\n嫌悪に満ちた驚きを抱いたが\n一向にその出来事が頭から離れなくなる\nその後,幼少期とも結びつけて生まれた考え',
      'quote': '「尿道バイブ」より引用',
      'correctAnswer': ['ハットリ'],
      'url': 'https://note.com/htysmyhan/n/nc126313333e8'
    },
  ];

  void _showCommentaryDialog(
      BuildContext context, String question, String commentary, String url) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: double.maxFinite, // 横幅を最大限に広げる
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    question,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Honoka',
                      height: 1.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '解説',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: 'Honoka'),
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: Text(
                    commentary,
                    style: TextStyle(fontSize: 15, fontFamily: 'Honoka'),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // 解説と閉じるボタンを右寄せに配置
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('閉じる'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Back.jpg'), // 画像のパスを指定
            fit: BoxFit.cover, // 画像をウィジェットに合わせて表示
            colorFilter: ColorFilter.mode(Color.fromARGB(255, 216, 184, 255),
                BlendMode.color), // ここで画像の色を指定
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: questions.length,
                  itemBuilder: (BuildContext context, int index) {
                    final question = questions[index];
                    return ListTile(
                      title: Text(
                        question['question'],
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Honoka',
                            fontWeight: FontWeight.bold,
                            height: 1.5),
                      ),
                      subtitle: Text(
                        question['quote'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: 'Honoka',
                        ),
                      ),
                      onTap: () {
                        _showCommentaryDialog(
                          context,
                          question['question'],
                          question['commentary'],
                          question['url'],
                        );
                      },
                      trailing: ElevatedButton(
                        onPressed: () {
                          _launchURL(question['url']);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fixedSize: const Size(70, 70),
                          backgroundColor:
                              const Color.fromARGB(255, 212, 255, 210)
                                  .withOpacity(0.7),
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
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    // リスト間の余白を指定
                    return SizedBox(height: 40); // 10ピクセルの余白を追加
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
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
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'URLを開くことができませんでした: $url';
    }
  }
}
