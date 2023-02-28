import 'package:flutter/material.dart';

import 'global.dart';

class Achievements extends StatefulWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  double h = 250;
  List<TextEditingController> achievement = [
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop('/');
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 20,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Enter Achievements",
                      style: Global.title,
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.grey.shade200,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: h,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Enter your Hobbies",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                            ...achievement
                                .map((e) => row(controller: e))
                                .toList(),
                            // row(controller: TextEditingController()),
                            // row(controller: TextEditingController()),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    h += 60;
                                    achievement.add(TextEditingController());
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Global.achievements =
                                    achievement.map((e) => (e.text)).toList();
                              },
                              child: const Text("Save")),
                          OutlinedButton(
                              onPressed: () {
                                achievement.clear();
                                setState(() {
                                  Global.achievements = [];
                                });
                              },
                              child: const Text("Cancel"))
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Row row({required TextEditingController controller}) {
    return Row(
      children: [
        SizedBox(
          width: 250,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Exceeded sales 17% average",
              hintStyle: Global.backText,
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                h -= 60;
                achievement.removeAt(achievement.indexOf(controller));
              });
            },
            icon: const Icon(
              Icons.delete,
              size: 20,
            ))
      ],
    );
  }
}
