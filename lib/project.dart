import 'package:flutter/material.dart';

import 'global.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  double h = 550;
  bool checkBoxValC = false;
  bool checkBoxValCp = false;
  bool checkBoxValF = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController rolesController = TextEditingController();
  TextEditingController technologiesController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> projectKey = GlobalKey();
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
                      "Projects",
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
                    key: projectKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          height: h,
                          color: Colors.white,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Project Title",
                                    style: Global.mainText,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter first your Project Title";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      Global.projectTitle = val!;
                                    });
                                  },
                                  controller: titleController,
                                  decoration: InputDecoration(
                                      hintText: "Resume Builder App",
                                      hintStyle: Global.backText,
                                      border: const OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Technologies",
                                    style: Global.mainText,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: const Text("C Programming"),
                                      value: checkBoxValC,
                                      onChanged: (val) {
                                        setState(() {
                                          checkBoxValC = val!;
                                          if (checkBoxValC == true) {
                                            Global.language
                                                .add('C Programming');
                                          } else if (checkBoxValC == false) {
                                            Global.language
                                                .remove('C Programming');
                                          }
                                        });
                                      }),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: const Text("C++"),
                                      value: checkBoxValCp,
                                      onChanged: (val) {
                                        setState(() {
                                          checkBoxValCp = val!;
                                          if (checkBoxValCp == true) {
                                            Global.language.add('C++');
                                          } else if (checkBoxValCp == false) {
                                            Global.language.remove('C++');
                                          }
                                        });
                                      }),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: const Text("Flutter"),
                                      value: checkBoxValF,
                                      onChanged: (val) {
                                        setState(() {
                                          checkBoxValF = val!;
                                          if (checkBoxValF == true) {
                                            Global.language.add('Flutter');
                                          } else if (checkBoxValF == false) {
                                            Global.language.remove('Flutter');
                                          }
                                        });
                                      }),
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
                                      return "Enter First your role";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      Global.roles = val!;
                                    });
                                  },
                                  controller: rolesController,
                                  decoration: InputDecoration(
                                      hintText:
                                          "Organize team members ,Code analysis",
                                      hintStyle: Global.backText,
                                      border: const OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Technologies",
                                    style: Global.mainText,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter first your technologies";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      Global.technologies = val!;
                                    });
                                  },
                                  controller: technologiesController,
                                  decoration: InputDecoration(
                                      hintText: "5-Programmers",
                                      hintStyle: Global.backText,
                                      border: const OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Project Description",
                                    style: Global.mainText,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter first your Project description";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      Global.projectDescription = val!;
                                    });
                                  },
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                      hintText:
                                          "Enter Your Project Description",
                                      hintStyle: Global.backText,
                                      border: const OutlineInputBorder()),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  if (projectKey.currentState!.validate()) {
                                    projectKey.currentState!.save();
                                  }
                                  setState(() {
                                    h += 90;
                                  });
                                },
                                child: const Text("Save")),
                            OutlinedButton(
                                onPressed: () {
                                  projectKey.currentState!.reset();
                                  titleController.clear();
                                  rolesController.clear();
                                  technologiesController.clear();
                                  descriptionController.clear();
                                  setState(() {
                                    Global.projectTitle = "";
                                    Global.technologiesCheck = [];
                                    Global.roles = "";
                                    Global.technologies = "";
                                    Global.projectDescription = "";
                                    checkBoxValC = false;
                                    checkBoxValCp = false;
                                    checkBoxValF = false;
                                    h -= 90;
                                  });
                                },
                                child: const Text("Cancel"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
