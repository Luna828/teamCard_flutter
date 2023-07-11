import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "dataManager.dart";

late SharedPreferences prefs;

class JunyoungPage extends StatelessWidget {
  JunyoungPage({super.key, required this.index});

  int index;

  @override
  Widget build(BuildContext context) {
    DataManager dataManager = context.read<DataManager>();
    Data data = dataManager.dataList[index];
    double boxSize = 20.0;

    return Consumer<DataManager>(
      builder: (context, datamanager, child) {
        List<Data> dataList = dataManager.dataList;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[600],
            title: Text(data.name),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(300.0),
                      child: Container(
                        child: Image.network(data.imgUrl),
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100), //중간 여백
                Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int idx) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                idx == 0
                                    ? "MBTI"
                                    : idx == 1
                                        ? "TMI"
                                        : "한마디",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  idx == 0
                                      ? data.mbti
                                      : idx == 1
                                          ? data.tmi
                                          : data.comment,
                                  style: TextStyle(fontSize: 25),
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => JunYoungDetail(
                                              index: index,
                                              type: idx == 0
                                                  ? "MBTI"
                                                  : idx == 1
                                                      ? "TMI"
                                                      : "한마디"),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 30,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class JunYoungDetail extends StatelessWidget {
  JunYoungDetail({super.key, required this.index, required this.type});

  final int index;
  String type;

  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DataManager dataManager = context.read<DataManager>();
    Data data = dataManager.dataList[index];
    String word = "";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
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
