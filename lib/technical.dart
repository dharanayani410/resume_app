import 'package:flutter/material.dart';

import 'global.dart';

class TechnicalSkills extends StatefulWidget {
  const TechnicalSkills({Key? key}) : super(key: key);
  @override
  State<TechnicalSkills> createState() => _TechnicalSkillsState();
}

class _TechnicalSkillsState extends State<TechnicalSkills> {
  double h = 250;
  List<TextEditingController> allFields = [
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
                      "Technical Skills",
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
                              "Enter your skills",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                            ...allFields
                                .map((e) => row(controller: e))
                                .toList(),
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
                                    allFields.add(TextEditingController());
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
                                Global.technical =
                                    allFields.map((e) => (e.text)).toList();
                              },
                              child: const Text("Save")),
                          OutlinedButton(
                              onPressed: () {
                                allFields.clear();
                                setState(() {
                                  Global.technical = [];
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
            onSaved: (val) {
              Global.technical.add(val);
            },
            controller: controller,
            decoration: InputDecoration(
              hintText: "C Programming, Web Technical",
              hintStyle: Global.backText,
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                h -= 60;
                allFields.removeAt(allFields.indexOf(controller));
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
