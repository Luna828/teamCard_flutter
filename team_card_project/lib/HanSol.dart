import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dataManager.dart';
import 'main.dart';

class HanSol extends StatefulWidget {
  HanSol({super.key, required this.index});

  int index;

  @override
  State<HanSol> createState() => _HanSolState();
}

class _HanSolState extends State<HanSol> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String MBTI = "MBTI";
    const String TMI = "TMI";
    const String COMMENT = "한 마디";

    ScrollController scrollController = ScrollController();

    return Consumer<DataManager>(builder: (context, dataManager, child) {
      Data data = dataManager.dataList[widget.index];
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[200],
          title: Text(
            '이한솔',
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
                  MBTI,
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
                                builder: (_) => HanSolCorrection(
                                      type: MBTI,
                                      index: widget.index,
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
                                builder: (_) => HanSolCorrection(
                                      type: TMI,
                                      index: widget.index,
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
                  COMMENT,
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
                            builder: (_) => HanSolCorrection(
                              type: COMMENT,
                              index: widget.index,
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

class HanSolCorrection extends StatelessWidget {
  HanSolCorrection({super.key, required this.type, required this.index});

  final String type;
  int index;
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DataManager dataManager = context.read<DataManager>();
    String word = "";
    contentController.text = type == "MBTI"
        ? dataManager.dataList[index].mbti
        : type == "TMI"
            ? dataManager.dataList[index].tmi
            : dataManager.dataList[index].comment;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        actions: [
          IconButton(
            onPressed: () {
              if (type == "MBTI") {
                dataManager.updateMbti(index: index, mbti: word);
                word = "";
              } else if (type == "TMI") {
                dataManager.updateTmi(index: index, tmi: word);
                word = "";
              } else {
                dataManager.updateComment(index: index, comment: word);
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
