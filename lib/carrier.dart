import 'package:flutter/material.dart';

import 'global.dart';

class Career extends StatefulWidget {
  const Career({Key? key}) : super(key: key);

  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> {
  double h = 250;
  double w = 150;
  GlobalKey<FormState> objectKey = GlobalKey();
  TextEditingController objectController = TextEditingController();
  TextEditingController designationController = TextEditingController();
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
                          color: Colors.white,
                          size: 20,
                        )),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Career Objectives",
                      style: Global.title,
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.grey.shade200,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: objectKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: h,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Career Objective",
                                style: Global.mainText,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter first your objective";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.careerObjective = val!;
                                });
                              },
                              controller: objectController,
                              maxLines: 7,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: "Description",
                                  hintStyle: Global.backText),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: w,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Current Designation(Experienced Candidate)",
                                style: Global.mainText,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter first your designation";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.designation = val!;
                                });
                              },
                              controller: designationController,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: "Software Engineer",
                                  hintStyle: Global.backText),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (objectKey.currentState!.validate()) {
                                  objectKey.currentState!.save();
                                }
                                setState(() {
                                  w += 10;
                                });
                              },
                              child: const Text("Save")),
                          OutlinedButton(
                              onPressed: () {
                                objectKey.currentState!.reset();
                                objectController.clear();
                                designationController.clear();

                                setState(() {
                                  Global.careerObjective = "";
                                  Global.designation = "";
                                });
                              },
                              child: const Text("Cancel"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
