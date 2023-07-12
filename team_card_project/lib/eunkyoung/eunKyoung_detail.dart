import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_card_project/dataManager.dart';

class EunKyoungDetailPage extends StatefulWidget {
  EunKyoungDetailPage(
      {super.key,
      required this.index,
      required this.hintText});

  late int index;
  late String hintText;

  @override
  State<EunKyoungDetailPage> createState() => _EunKyoungDetailPageState();
}

class _EunKyoungDetailPageState extends State<EunKyoungDetailPage> {
  @override
  Widget build(BuildContext context) {
    DataManager dataManager = context.read<DataManager>();

    TextEditingController contentController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '수정하기',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink[100],
        actions: [
          ElevatedButton(
            onPressed: () {},
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
        ),
      ),
    );
  }
}
