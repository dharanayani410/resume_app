import 'package:flutter/material.dart';

import 'global.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  double h = 450;
  GlobalKey<FormState> educationKey = GlobalKey();
  TextEditingController degreeController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController yearController = TextEditingController();

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
                      width: 80,
                    ),
                    Text("Education", style: Global.title)
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
                        padding: const EdgeInsets.all(20),
                        height: h,
                        width: double.infinity,
                        color: Colors.white,
                        child: Form(
                          key: educationKey,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Course/Degree",
                                  style: Global.mainText,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter first your Course";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.degree = val!;
                                  });
                                },
                                controller: degreeController,
                                decoration: InputDecoration(
                                    hintText: "B.Tech Information Technology",
                                    hintStyle: Global.backText,
                                    border: const OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "School/College/Institute",
                                  style: Global.mainText,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter first your College";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.college = val!;
                                  });
                                },
                                controller: collegeController,
                                decoration: InputDecoration(
                                    hintText: "Gujarat University",
                                    hintStyle: Global.backText,
                                    border: const OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Percentage",
                                  style: Global.mainText,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter first your percentage";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.percentage = val!;
                                  });
                                },
                                controller: percentageController,
                                decoration: InputDecoration(
                                    hintText: "70%(or)7.0CGPA",
                                    hintStyle: Global.backText,
                                    border: const OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Year of Pass",
                                  style: Global.mainText,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter first your Passing year";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.year = val!;
                                  });
                                },
                                controller: yearController,
                                decoration: InputDecoration(
                                    hintText: "2019",
                                    hintStyle: Global.backText,
                                    border: const OutlineInputBorder()),
                              )
                            ],
                          ),
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
                                if (educationKey.currentState!.validate()) {
                                  educationKey.currentState!.save();
                                }
                                setState(() {
                                  h += 90;
                                });
                              },
                              child: const Text("Save")),
                          OutlinedButton(
                              onPressed: () {
                                educationKey.currentState!.reset();
                                degreeController.clear();
                                collegeController.clear();
                                percentageController.clear();
                                yearController.clear();

                                setState(() {
                                  Global.degree = "";
                                  Global.college = "";
                                  Global.percentage = "";
                                  Global.year = "";
                                });
                              },
                              child: const Text("Cancel"))
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
