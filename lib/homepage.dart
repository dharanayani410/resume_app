import 'package:flutter/material.dart';

import 'global.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('menuPage');
        },
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Resume Builder",
                      style: Global.title,
                    ),
                    Text(
                      "RESUMES",
                      style: Global.subTitle,
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      child: Image.asset(
                        "asset/images/cardboard-box.png",
                        height: 50,
                      )),
                  Text("No Resumes +Creates new resumes",
                      style: Global.backText),
                  const Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
