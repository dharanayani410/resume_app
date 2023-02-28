import 'package:flutter/material.dart';

import 'global.dart';

class Declaration extends StatefulWidget {
  const Declaration({Key? key}) : super(key: key);

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {
  double h = 450;
  bool switchVal = false;
  GlobalKey<FormState> declarationKey = GlobalKey();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController placeController = TextEditingController();

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
                      width: 70,
                    ),
                    Text(
                      "Declaration",
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
                    (switchVal == false)
                        ? Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            height: 70,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Declaration",
                                  style: Global.mainText,
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                Switch(
                                    value: switchVal,
                                    onChanged: (val) {
                                      setState(() {
                                        switchVal = val;
                                      });
                                    }),
                              ],
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            height: h,
                            color: Colors.white,
                            child: Form(
                              key: declarationKey,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Declaration",
                                        style: Global.mainText,
                                      ),
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      Switch(
                                          value: switchVal,
                                          onChanged: (val) {
                                            setState(() {
                                              switchVal = val;
                                            });
                                          }),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Image.asset(
                                      "asset/images/dartBoard.png",
                                      height: 50,
                                    ),
                                  ),
                                  TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter the first description";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) {
                                      setState(() {
                                        Global.description = val!;
                                      });
                                    },
                                    controller: descriptionController,
                                    decoration: InputDecoration(
                                        hintText: "Description",
                                        hintStyle: Global.backText,
                                        border: const OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 1,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey)),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Date",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey.shade400),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                            width: 120,
                                            height: 70,
                                            color: Colors.white,
                                            child: TextFormField(
                                              validator: (val) {
                                                if (val!.isEmpty) {
                                                  return "Enter the first date";
                                                }
                                                return null;
                                              },
                                              onSaved: (val) {
                                                setState(() {
                                                  Global.date = val!;
                                                });
                                              },
                                              controller: dateController,
                                              decoration: InputDecoration(
                                                  hintStyle: Global.backText,
                                                  hintText: "DD/MM/YYYY",
                                                  border:
                                                      const OutlineInputBorder()),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(children: [
                                        Text(
                                          "Place(Interview\nvenue/city)",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey.shade400),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                          width: 120,
                                          height: 70,
                                          color: Colors.white,
                                          child: TextFormField(
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Enter the first place";
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Global.place = val!;
                                              });
                                            },
                                            controller: placeController,
                                            decoration: InputDecoration(
                                                hintStyle: Global.backText,
                                                hintText: "Eg.Surat",
                                                border:
                                                    const OutlineInputBorder()),
                                          ),
                                        )
                                      ])
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            if (declarationKey.currentState!
                                                .validate()) {
                                              declarationKey.currentState!
                                                  .save();
                                              setState(() {});
                                            }
                                          },
                                          child: const Text("Save")),
                                      OutlinedButton(
                                          onPressed: () {
                                            declarationKey.currentState!
                                                .reset();
                                            descriptionController.clear();
                                            dateController.clear();
                                            placeController.clear();
                                            setState(() {
                                              Global.description = "";
                                              Global.date = "";
                                              Global.place = "";
                                            });
                                          },
                                          child: const Text("Cancel"))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
