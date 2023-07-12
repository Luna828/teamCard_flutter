import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_card_project/dataManager.dart';

class EunKyoungDetailPage extends StatefulWidget {
  EunKyoungDetailPage({
    super.key,
    required this.index,
    required this.hintText,
    required this.type,
  });

  late int index;
  String type;
  late String hintText;

  @override
  State<EunKyoungDetailPage> createState() => _EunKyoungDetailPageState();
}

class _EunKyoungDetailPageState extends State<EunKyoungDetailPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController contentController = TextEditingController();
    DataManager dataManager = context.read();
    //onChanged 에 잠시 넣어둘 값들
    String word = "";

    contentController.text = widget.type == "MBTI"
        ? dataManager.dataList[widget.index].mbti
        : widget.type == "TMI"
            ? dataManager.dataList[widget.index].tmi
            : dataManager.dataList[widget.index].comment;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        actions: [
          ElevatedButton(
            onPressed: () {
              if (widget.type == "MBTI") {
                dataManager.updateMbti(index: widget.index, mbti: word);
              } else if (widget.type == "TMI") {
                dataManager.updateTmi(index: widget.index, tmi: word);
              } else {
                dataManager.updateComment(index: widget.index, comment: word);
              }
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
            ),
            child: Text('저장',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: contentController,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
          ),
          expands: true,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          onChanged: (val) {
            word = val;
          },
        ),
      ),
    );
  }
}
