import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_card_project/JunYoung.dart';
import 'package:team_card_project/EunKyoung.dart';
import 'GyuYeon.dart';
import "dataManager.dart";

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataManager()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "해시태그#",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '우리 팀을 소개합니다. \u{1F603}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => EunKyoungCardPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    backgroundColor: Colors.pink[100]),
                child: Text(
                  '김은경',
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JunyoungPage(
                                index: 3,
                              )));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    backgroundColor: Colors.green[600]),
                child: Text(
                  '서준영',
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    backgroundColor: Colors.cyanAccent[100]),
                child: Text(
                  '이대현',
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    backgroundColor: Colors.amber[200]),
                child: Text(
                  '이한솔',
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    backgroundColor: Colors.lightGreen[900]),
                child: Text(
                  '정다올',
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => GyuYeon()));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    backgroundColor: Colors.tealAccent[100]),
                child: Text(
                  '조규연',
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}

class CorrectionPage extends StatelessWidget {
  CorrectionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('수정하기', style: TextStyle(fontWeight: FontWeight.bold)),
            actions: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
            ),
            child: Text('저장',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ]));
  }
}
