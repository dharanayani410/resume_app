import 'package:flutter/material.dart';

import 'global.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  dynamic radioVal;
  bool employee = true;
  GlobalKey<FormState> experienceKey = GlobalKey();
  TextEditingController companyController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  double h = 500;
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
                      width: 70,
                    ),
                    Text(
                      "Experience",
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
                child: Form(
                  key: experienceKey,
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
                                "Company Name",
                                style: Global.mainText,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter first your company name";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.company = val!;
                                });
                              },
                              controller: companyController,
                              decoration: InputDecoration(
                                  hintText: "New enterprise,San Francisco",
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
                                  return "Enter first your school";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.school = val!;
                                });
                              },
                              controller: schoolController,
                              decoration: InputDecoration(
                                  hintText: "Quality Test Engineer",
                                  hintStyle: Global.backText,
                                  border: const OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Roles",
                                style: Global.mainText,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter first your role";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.role = val!;
                                });
                              },
                              controller: roleController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                  hintText:
                                      "Working with team members\nto come up with new concepts\nand product analysis... ",
                                  hintStyle: Global.backText,
                                  border: const OutlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Employed Status",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Radio(
                                      value: 'Previously Employed',
                                      groupValue: radioVal,
                                      onChanged: (val) {
                                        employee = true;
                                        setState(() {
                                          radioVal = val;
                                          Global.employee = 'previously';
                                        });
                                      }),
                                  const Text("Previously Employed"),
                                  Radio(
                                      value: 'Currently Employed',
                                      groupValue: radioVal,
                                      onChanged: (val) {
                                        employee = false;
                                        setState(() {
                                          radioVal = val;
                                          Global.employee = 'currently';
                                        });
                                      }),
                                  const Text("Currently Employed")
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            (employee == true)
                                ? Column(
                                    children: [
                                      const Text(
                                        "Date Joined",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 100,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border:
                                                  const OutlineInputBorder(),
                                              hintText: 'DD/MM/YYYY',
                                              hintStyle: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey.shade200)),
                                        ),
                                      )
                                    ],
                                  )
                                : (Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            "Date Joined",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 100,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  hintText: 'DD/MM/YYYY',
                                                  hintStyle: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .grey.shade200)),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Date Exit",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 30,
                                            width: 100,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  hintText: 'DD/MM/YYYY',
                                                  hintStyle: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors
                                                          .grey.shade200)),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (experienceKey.currentState!.validate()) {
                                experienceKey.currentState!.save();
                              }
                              setState(() {
                                h += 90;
                              });
                            },
                            child: const Text("Save"),
                          ),
                          OutlinedButton(
                              onPressed: () {
                                experienceKey.currentState!.reset();
                                companyController.clear();
                                schoolController.clear();
                                roleController.clear();
                                setState(() {
                                  Global.company = "";
                                  Global.school = "";
                                  Global.role = "";
                                  Global.employee = "";
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
          ),
        ],
      ),
    );
  }
}
