import 'package:flutter/material.dart';

import 'global.dart';

class References extends StatefulWidget {
  const References({Key? key}) : super(key: key);

  @override
  State<References> createState() => _ReferencesState();
}

class _ReferencesState extends State<References> {
  TextEditingController referenceController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController instituteController = TextEditingController();
  GlobalKey<FormState> referenceKey = GlobalKey();
  double h = 330;

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
                    Text(
                      "References",
                      style: Global.title,
                    ),
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
                        child: Form(
                          key: referenceKey,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Reference Name",
                                  style: Global.mainText,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter first reference name";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.reference = val!;
                                  });
                                },
                                controller: referenceController,
                                decoration: InputDecoration(
                                    hintText: "suresh shah",
                                    hintStyle: Global.backText,
                                    border: const OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Designation",
                                  style: Global.mainText,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter first reference designation";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.referenceDesignation = val!;
                                  });
                                },
                                controller: designationController,
                                decoration: InputDecoration(
                                    hintText: "Marketing Manager ID -342332",
                                    hintStyle: Global.backText,
                                    border: const OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Organization/Institute",
                                  style: Global.mainText,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter first institute";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.institute = val!;
                                  });
                                },
                                controller: instituteController,
                                decoration: InputDecoration(
                                    hintText: "Green Energy Pvt. Ltd",
                                    hintStyle: Global.backText,
                                    border: const OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
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
                                if (referenceKey.currentState!.validate()) {
                                  referenceKey.currentState!.save();
                                }
                                setState(() {
                                  h += 65;
                                });
                              },
                              child: const Text("Save")),
                          OutlinedButton(
                              onPressed: () {
                                referenceKey.currentState!.reset();
                                referenceController.clear();
                                designationController.clear();
                                instituteController.clear();
                                setState(() {
                                  Global.reference = "";
                                  Global.referenceDesignation = "";
                                  Global.institute = "";
                                  h -= 65;
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
}
