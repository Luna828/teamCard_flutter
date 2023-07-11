import 'package:flutter/material.dart';

class EunKyoung2CardPage extends StatefulWidget {
  const EunKyoung2CardPage({super.key});

  @override
  State<EunKyoung2CardPage> createState() => _EunKyoung2CardPageState();
}

class _EunKyoung2CardPageState extends State<EunKyoung2CardPage> {
  @override
  Widget build(BuildContext context) {
    const String MBTI = "MBTI";
    const String TMI = "TMI";
    const String IN_SHORT = "한 마디";

    return Scaffold(
      appBar: AppBar(
        title: Text("김은경"),
        centerTitle: true,
        backgroundColor: Colors.pink[100],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: Container(
                height: 200,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.network(
                    "https://avatars.githubusercontent.com/u/93186591?v=4",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return myListTile(
                  "한 마디",
                  "안녕하세요, 이번 iOS_7기로 합류하게 된 김은경이라고합니다. 4개월동안 취뽀를 위해서 함께 노력해봐요!",
                  context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget myListTile(String title, String content, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: ListTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(
            height: 10,
          ),
          Text(content),
        ],
      ),
      titleTextStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 수정
          IconButton(
            icon: Icon(Icons.edit),
            iconSize: 30,
            onPressed: () {},
            color: Colors.black,
          ),
        ],
      ),
    ),
  );
}
