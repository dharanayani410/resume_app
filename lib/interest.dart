import 'package:flutter/material.dart';

import 'global.dart';

class Interest extends StatefulWidget {
  const Interest({Key? key}) : super(key: key);

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  double h = 250;
  List<TextEditingController> interest = [
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
                      "Interest/Hobbies",
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
                  physics: const BouncingScrollPhysics(),
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
                            ...interest.map((e) => row(controller: e)).toList(),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: double.infinity,
                              height: 50,
                              color: Colors.white,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    h += 60;
                                    interest.add(TextEditingController());
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            )
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
                                Global.interest =
                                    interest.map((e) => (e.text)).toList();
                              },
                              child: const Text("Save")),
                          OutlinedButton(
                              onPressed: () {
                                interest.clear();
                                setState(() {
                                  Global.interest = [];
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
              hintText: "Interests/Hobbies",
              hintStyle: Global.backText,
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                h -= 60;
                interest.removeAt(interest.indexOf(controller));
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
