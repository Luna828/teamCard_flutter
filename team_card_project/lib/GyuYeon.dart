import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dataManager.dart';

const int TYPE_MBTI = 0;
const int TYPE_TMI = 1;
const int TYPE_ETC = 2;
const int INDEX = 1;

class GyuYeon extends StatefulWidget {
  GyuYeon({super.key, required this.index});

  int index;

  @override
  State<GyuYeon> createState() => _GyuYeonState();
}

class _GyuYeonState extends State<GyuYeon> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DataManager dataManager = context.read<DataManager>();
    Data data = dataManager.dataList[widget.index];
    ScrollController scrollController = ScrollController();
    return Consumer<DataManager>(builder: (context, dataManager, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.tealAccent[100],
          title: Text(
            data.name,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: 200,
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Image.network(
                          data.imgUrl,
                          fit: BoxFit.cover,
                        ),
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
                  title: Text(data.mbti),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => GyuYeonCorrection(
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
                  title: Text(data.tmi),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => GyuYeonCorrection(
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
                  title: Text(data.comment),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => GyuYeonCorrection(
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
        ),
      );
    });
  }
}

class GyuYeonCorrection extends StatelessWidget {
  GyuYeonCorrection({super.key, required this.type});

  final int type;

  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DataManager dataManager = context.read<DataManager>();
    String word = "";
    Data data = dataManager.dataList[INDEX];
    contentController.text = type == TYPE_MBTI
        ? data.mbti
        : type == TYPE_TMI
            ? data.tmi
            : data.comment;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[100],
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
