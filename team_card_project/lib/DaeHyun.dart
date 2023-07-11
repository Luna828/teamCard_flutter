import 'package:flutter/material.dart';
import 'main.dart';

class DaeHyun extends StatefulWidget {
  const DaeHyun({super.key});

  @override
  State<DaeHyun> createState() => _DaeHyunState();
}

class _DaeHyunState extends State<DaeHyun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "이대현",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Container(
                height: 200,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.network(
                    "https://github.com/Luna828/teamCard_flutter/assets/37580034/895c4cc0-2f6e-4101-8582-92c59b93a66e",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "MBTI",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          TextBox("INFJ", context),
          const SizedBox(height: 20),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "TMI",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          TextBox("커피우유 > 아아", context),
          const SizedBox(height: 20),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "한 마디",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          TextBox("으쌰으쌰!", context),
        ],
      ),
    );
  }
}

Widget TextBox(String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text(title),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        iconSize: 30,
        onPressed: () {
          print("clicked");
        },
      ),
    ),
  );
}
