import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_card_project/GyuYeon.dart';
import 'dataManager.dart';
import 'main.dart';

class HanSol extends StatefulWidget {
  const HanSol({super.key});
  @override
  State<HanSol> createState() => _HanSolState();
}

class _HanSolState extends State<HanSol> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        title: Text(
          '이한솔',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.network(
                    "https://avatars.githubusercontent.com/u/139109343?v=4",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'MBTI',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('INFJ'),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => HanSolCorrection(
                                  type: TYPE_MBTI,
                                )));
                  },
                  icon: Icon(Icons.edit)),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'TMI',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('피아노 치는걸 좋아합니다!'),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => HanSolCorrection(
                                  type: TYPE_TMI,
                                )));
                  },
                  icon: Icon(Icons.edit)),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '한 마디',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('모두들 화이팅합시다~~'),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HanSolCorrection(
                          type: TYPE_ETC,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.edit)),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HanSolCorrection extends StatelessWidget {
  HanSolCorrection({super.key, required this.type});

  final int type;

  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DataManager dataManager = context.read<DataManager>();
    String word = "";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        actions: [
          IconButton(
            onPressed: () {
              if (type == TYPE_MBTI) {
                dataManager.updateMbti(index: INDEX, mbti: word);
                word = "";
              } else if (type == TYPE_TMI) {
                dataManager.updateTmi(index: INDEX, tmi: word);
                word = "";
              } else if (type == TYPE_ETC) {
                dataManager.updateComment(index: INDEX, comment: word);
                word = "";
              }
              Navigator.pop(context);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: contentController,
          decoration: InputDecoration(
            hintText: "내용을 입력하세요",
            border: InputBorder.none,
          ),
          autofocus: true,
          maxLines: null,
          expands: true,
          keyboardType: TextInputType.multiline,
          onChanged: (value) {
            word = value;
          },
        ),
      ),
    );
  }
}
