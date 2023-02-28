import 'package:flutter/material.dart';

import 'global.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  dynamic radioValStatus;
  bool checkBoxValE = false;
  bool checkBoxValH = false;
  bool checkBoxValG = false;
  TextEditingController dateController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  GlobalKey<FormState> personalKey = GlobalKey();
  double h = 470;
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
                    width: 50,
                  ),
                  Text(
                    "Personal Details",
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
                      padding: const EdgeInsets.all(20),
                      height: h,
                      width: double.infinity,
                      color: Colors.white,
                      child: Form(
                        key: personalKey,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "DOB",
                                style: Global.mainText,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              color: Colors.white,
                              child: TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter first your BirthDate";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.dob = val!;
                                  });
                                },
                                controller: dateController,
                                decoration: InputDecoration(
                                    hintText: 'DD/MM/YYYY',
                                    border: const OutlineInputBorder(),
                                    hintStyle: Global.backText),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Marital Status",
                                style: Global.mainText,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Radio(
                                    value: 'Single',
                                    groupValue: radioValStatus,
                                    onChanged: (val) {
                                      setState(() {
                                        radioValStatus = val;
                                        Global.marital = 'Single';
                                      });
                                    }),
                                const Text("Single"),
                                Radio(
                                    value: 'Married',
                                    groupValue: radioValStatus,
                                    onChanged: (val) {
                                      setState(() {
                                        radioValStatus = val;
                                        Global.marital = 'Married';
                                      });
                                    }),
                                const Text("Married"),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Languages Known",
                                style: Global.mainText,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 280,
                                  height: 50,
                                  child: CheckboxListTile(
                                      title: const Text("English"),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: checkBoxValE,
                                      onChanged: (val) {
                                        setState(() {
                                          checkBoxValE = val!;
                                          if (checkBoxValE == true) {
                                            Global.language.add('English');
                                          } else if (checkBoxValE == false) {
                                            Global.language.remove('English');
                                          }
                                        });
                                      }),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 280,
                                  height: 50,
                                  child: CheckboxListTile(
                                      title: const Text("Hindi"),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: checkBoxValH,
                                      onChanged: (val) {
                                        setState(() {
                                          checkBoxValH = val!;
                                          if (checkBoxValH == true) {
                                            Global.language.add('Hindi');
                                          } else if (checkBoxValH == false) {
                                            Global.language.remove('Hindi');
                                          }
                                        });
                                      }),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 280,
                                  height: 50,
                                  child: CheckboxListTile(
                                      title: const Text("Gujarati"),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: checkBoxValG,
                                      onChanged: (val) {
                                        setState(() {
                                          checkBoxValG = val!;
                                          if (checkBoxValG == true) {
                                            Global.language.add('Gujarati');
                                          } else if (checkBoxValG == false) {
                                            Global.language.remove('Gujarati');
                                          }
                                        });
                                      }),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Nationality",
                                style: Global.mainText,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              color: Colors.white,
                              child: TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter first your Nationality";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  setState(() {
                                    Global.nationality = val!;
                                  });
                                },
                                controller: nationalityController,
                                decoration: InputDecoration(
                                    hintText: "Indian",
                                    border: const OutlineInputBorder(),
                                    hintStyle: Global.backText),
                              ),
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
                              if (personalKey.currentState!.validate()) {
                                personalKey.currentState!.save();
                              }
                              setState(() {
                                h += 30;
                                // Global.contact = false;
                              });
                            },
                            child: const Text("Save")),
                        OutlinedButton(
                            onPressed: () {
                              personalKey.currentState!.reset();
                              dateController.clear();
                              nationalityController.clear();
                              setState(() {
                                Global.dob = "";
                                Global.nationality = "";
                                Global.marital = "";
                                Global.language = [];
                                checkBoxValE = false;
                                checkBoxValH = false;
                                checkBoxValG = false;
                                radioValStatus = '';
                                h -= 30;
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
    ));
  }
}
