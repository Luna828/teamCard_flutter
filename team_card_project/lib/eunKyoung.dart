import 'package:flutter/material.dart';

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

    TextEditingController MBT_controller = TextEditingController();
    TextEditingController TMI_controller = TextEditingController();
    TextEditingController IN_SHORT_controller = TextEditingController();

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
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              MBTI,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: MBT_controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "MBTI 를 입력해 주세요",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              TMI,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: TMI_controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "TMI 를 입력해 주세요",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              IN_SHORT,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: IN_SHORT_controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "한 마디를 입력해 주세요"),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
