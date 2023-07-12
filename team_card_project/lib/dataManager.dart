import 'dart:convert';
import 'package:flutter/material.dart';

import 'main.dart';

class Data {
  Data({
    required this.name,
    required this.imgUrl,
    required this.mbti,
    required this.comment,
    required this.tmi,
  });

  String name;
  String imgUrl;
  String mbti;
  String tmi;
  String comment;

  Map toJson() {
    return {
      'name': name,
      'imgUrl': imgUrl,
      'mbti': mbti,
      'tmi': tmi,
      'comment': comment,
    };
  }

  factory Data.fromJson(json) {
    return Data(
        name: json['name'],
        imgUrl: json['imgUrl'],
        mbti: json['mbti'],
        tmi: json['tmi'],
        comment: json['comment']);
  }
}

class DataManager extends ChangeNotifier {
  DataManager() {
    loadDataList();
  }

  List<Data> dataList = [
    Data(imgUrl: "https://avatars.githubusercontent.com/u/93186591?v=4", name: "김은경", mbti: "ISFJ", comment: "잘부탁드려요", tmi: "잠을 두시간 자서 죽겠어요.."),
    Data(
        imgUrl:
            'https://i.postimg.cc/VLZxYVfQ/729-CE27-A-F153-4-F82-A0-AA-5710-ED969-B4-D.jpg',
        name: "조규연",
        mbti: "ISTP",
        comment: "열심히 공부해봅시다!",
        tmi: "노래, 게임 좋아합니다."),
    Data(imgUrl: "", name: "이한솔", mbti: "", comment: "", tmi: ""),
    Data(
        imgUrl: 'https://i.postimg.cc/qqFpMbLP/DSC-1658.jpg',
        name: "서준영",
        mbti: "ISTP",
        comment: "반갑습니다. 다함께 열심히 공부해 보고싶습니다!",
        tmi: "자동차 공학부를 전공하였습니다."),
    Data(imgUrl: "", name: "이대현", mbti: "", comment: "", tmi: ""),
    Data(imgUrl: "", name: "정다올", mbti: "", comment: "", tmi: ""),
  ];

  updateMbti({required int index, required String mbti}) {
    Data data = dataList[index];
    if (mbti != "") {
      data.mbti = mbti;
    }

    notifyListeners();
    saveDataList();
  }

  updateComment({required int index, required String comment}) {
    Data data = dataList[index];
    if (comment != "") {
      data.comment = comment;
    }

    notifyListeners();
    saveDataList();
  }

  updateTmi({required int index, required String tmi}) {
    Data data = dataList[index];
    if (tmi != "") {
      data.tmi = tmi;
    }

    notifyListeners();
    saveDataList();
  }

  saveDataList() {
    List memoJsonList = dataList.map((data) => data.toJson()).toList();

    String jsonString = jsonEncode(memoJsonList);

    prefs.setString('dataList', jsonString);
  }

  loadDataList() {
    String? jsonString = prefs.getString('dataList');

    if (jsonString == null) return;

    List dataJsonList = jsonDecode(jsonString);

    dataList = dataJsonList.map((json) => Data.fromJson(json)).toList();
  }
}
