import 'package:flutter/material.dart';

import 'main.dart';

class EunKyoungCardPage extends StatefulWidget {
  const EunKyoungCardPage({super.key});

  @override
  State<EunKyoungCardPage> createState() => _EunKyoungCardPageState();
}

class _EunKyoungCardPageState extends State<EunKyoungCardPage> {
  @override
  Widget build(BuildContext context) {
    const String MBTI = "MBTI";
    const String TMI = "TMI";
    const String IN_SHORT = "한 마디";

    ScrollController scrollController = ScrollController();

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
            myImage("https://avatars.githubusercontent.com/u/93186591?v=4"),
            listTilePadding(MBTI),
            myListTile("ISFJ", context),
            listTilePadding(TMI),
            myListTile("저는 중국에서 스페인어과를 중국어 중ㄱ국어 ㅇㅇㅇㅇㅇ졸업하고 개발시장에 뛰어든 비전공자 입니다! 잘 부탁드려요!", context),
            listTilePadding(IN_SHORT),
            myListTile(
                "dddddddddddddddddd안녕하세요,dddddddddddd dddddddddddddddddddddddd이번 iOS_7기로 합류하게 된 김은경이라고합니다. 4개월동안 취뽀를 위해서 함께 노력해봐요!", context),
          ],
        ),
      ),
    );
  }
}


Widget myImage(String image){
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

Widget listTilePadding(String title){
  return Column(
    children: [
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    ]
  );
}

Widget myListTile(String content, BuildContext context) {
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
              context, MaterialPageRoute(builder: (_) => CorrectionPage()));
        },
        color: Colors.black,
      ),
    ),
  );
}
