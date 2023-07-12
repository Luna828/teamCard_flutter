import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_card_project/dataManager.dart';

import 'eunKyoung_detail.dart';

class EunKyoungCardPage extends StatefulWidget {
  EunKyoungCardPage({super.key, required this.index});

  int index;

  @override
  State<EunKyoungCardPage> createState() => _EunKyoungCardPageState();
}

class _EunKyoungCardPageState extends State<EunKyoungCardPage> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    const String MBTI = "MBTI";
    const String TMI = "TMI";
    const String COMMENT = "한 마디";

    ScrollController scrollController = ScrollController();

    return Consumer<DataManager>(builder: (context, dataManager, child) {
      Data data = dataManager.dataList[index];
      return Scaffold(
        appBar: AppBar(
          title: Text("김은경"),
          centerTitle: true,
          backgroundColor: Colors.pink[100],
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //이미지 사진 넣는 부분
              myImage(data.imgUrl),
              listTilePadding(MBTI),
              myListTile(
                  data.mbti, 
                  context, index,
                  dataManager.dataList[index].mbti,
                  MBTI,
              ),
              listTilePadding(TMI),
              myListTile(
                  data.tmi, 
                  context, index, 
                  dataManager.dataList[index].tmi,
                  TMI,
              ),
              listTilePadding(COMMENT),
              myListTile(
                  data.comment, 
                  context, 
                  index,
                  dataManager.dataList[index].comment,
                  COMMENT,
              ),
            ],
          ),
        ),
      );
    });
  }
}

Widget myImage(String image) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Center(
      child: Container(
        height: 200,
        width: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(300),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

Widget listTilePadding(String title) {
  return Column(children: [
    const SizedBox(height: 20),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title!,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  ]);
}

Widget myListTile(String content, BuildContext context, int index,
    String hintText, String type) {
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
              builder: (_) => EunKyoungDetailPage(
                index: index,
                hintText: hintText,
                type: type,
              ),
            ),
          );
        },
        color: Colors.black,
      ),
    ),
  );
}
