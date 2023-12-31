import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "dataManager.dart";

late SharedPreferences prefs;

class JunyoungPage extends StatelessWidget {
  JunyoungPage({super.key, required this.index});

  int index;
  var appBarColor = Colors.green[600];

  @override
  Widget build(BuildContext context) {
    DataManager dataManager = context.read<DataManager>();
    Data data = dataManager.dataList[index];
    ScrollController scrollController = ScrollController();
    double boxSize = 20.0;

    return Consumer<DataManager>(
      builder: (context, datamanager, child) {
        List<Data> dataList = dataManager.dataList;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Text(data.name),
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                imageView(data.imgUrl),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    listTitle("MBTI"),
                    listContent(data.mbti, context, "MBTI", index, appBarColor),
                    SizedBox(height: 20),
                    listTitle("TMI"),
                    listContent(data.tmi, context, "TMI", index, appBarColor),
                    SizedBox(height: 20),
                    listTitle("한 마디"),
                    listContent(
                        data.comment, context, "한마디", index, appBarColor),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget imageView(String imgUrl) {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: Center(
      child: Container(
        height: 200,
        width: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(300),
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

Widget listTitle(String type) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Text(
      type,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}

Widget listContent(String content, BuildContext context, String type, int idx,
    Color? appBarColor) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text(content),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        iconSize: 30,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => JunYoungDetail(
                index: idx,
                type: type,
                appBarColor: appBarColor,
              ),
            ),
          );
        },
        color: Colors.black,
      ),
    ),
  );
}

class JunYoungDetail extends StatelessWidget {
  JunYoungDetail(
      {super.key,
      required this.index,
      required this.type,
      required this.appBarColor});

  final int index;
  String type;
  Color? appBarColor;
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DataManager dataManager = context.read<DataManager>();
    Data data = dataManager.dataList[index];
    String word = "";
    contentController.text = type == "MBTI"
        ? data.mbti
        : type == "TMI"
            ? data.tmi
            : data.comment;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
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
            hintText: "$type 를 입력하세요",
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
