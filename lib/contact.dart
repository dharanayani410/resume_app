import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'global.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  double h = 350;
  GlobalKey<FormState> cKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addController = TextEditingController();
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? photo;
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop('/');
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          )),
                      const Spacer(
                        flex: 3,
                      ),
                      Text(
                        "Resume Workspace",
                        style: Global.title,
                      ),
                      const Spacer(
                        flex: 3,
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Global.contact = true;
                          });
                        },
                        child: Text(
                          "Contact",
                          style: Global.subTitle,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Global.contact = false;
                          });
                        },
                        child: Text(
                          "Photo",
                          style: Global.subTitle,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: (Global.contact == true)
                ? Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.grey.shade200,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: h,
                            width: double.infinity,
                            color: Colors.white,
                            child: Form(
                              key: cKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'asset/images/name.png',
                                          height: 40,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Enter first your name";
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Global.contactName = val!;
                                              });
                                            },
                                            controller: nameController,
                                            decoration: const InputDecoration(
                                              hintText: 'Name',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'asset/images/email.png',
                                          height: 40,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Enter first your email";
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Global.contactEmail = val!;
                                              });
                                            },
                                            controller: emailController,
                                            decoration: const InputDecoration(
                                              hintText: 'Email',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'asset/images/phone.png',
                                          height: 40,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Enter first phone name";
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Global.contactPhone = val!;
                                              });
                                            },
                                            controller: phoneController,
                                            decoration: const InputDecoration(
                                              hintText: 'Phone',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'asset/images/location.png',
                                          height: 40,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Enter first your address";
                                              }
                                              return null;
                                              // return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Global.contactAdd = val!;
                                              });
                                            },
                                            controller: addController,
                                            decoration: const InputDecoration(
                                              hintText:
                                                  'Address(Street,Building No)',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Enter first your address";
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Global.contactAdd1 = val!;
                                              });
                                            },
                                            controller: add1Controller,
                                            decoration: const InputDecoration(
                                              hintText: 'Address Line 2',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Enter first your address";
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Global.contactAdd2 = val!;
                                              });
                                            },
                                            controller: add2Controller,
                                            decoration: const InputDecoration(
                                              hintText: 'Address Line 3',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
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
                                  if (cKey.currentState!.validate()) {
                                    cKey.currentState!.save();
                                  }
                                  // Global.contact = false;
                                  setState(() {
                                    h += 90;
                                  });
                                },
                                child: const Text("Save"),
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    cKey.currentState!.reset();
                                    nameController.clear();
                                    emailController.clear();
                                    phoneController.clear();
                                    addController.clear();
                                    add1Controller.clear();
                                    add2Controller.clear();
                                    setState(() {
                                      Global.contactName = "";
                                      Global.contactEmail = "";
                                      Global.contactPhone = "";
                                      Global.contactAdd = "";
                                      Global.contactAdd1 = "";
                                      Global.contactAdd2 = "";
                                      h -= 90;
                                    });
                                  },
                                  child: const Text("Cancel"))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.grey.shade200,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          color: Colors.white,
                          height: 350,
                          width: double.infinity,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.grey,
                                backgroundImage:
                                    (photo == null) ? null : FileImage(photo!),
                              ),
                              FloatingActionButton(
                                onPressed: () async {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: const Text("Pick Image"),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () async {
                                                  image =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .camera);
                                                  setState(() {
                                                    photo = File(image!.path);
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Icon(
                                                    Icons.camera_alt)),
                                            ElevatedButton(
                                                onPressed: () async {
                                                  image =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  setState(() {
                                                    photo = File(image!.path);
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Icon(Icons.photo))
                                          ],
                                        );
                                      });
                                },
                                mini: true,
                                child: const Icon(Icons.add),
                              )
                            ],
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Global.pic = 'photo';
                                  Navigator.of(context).pop();
                                });
                              },
                              child: const Text("Save"),
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    photo = null;
                                  });
                                },
                                child: const Text("Cancel"))
                          ],
                        ),
                        const Spacer(
                          flex: 3,
                        )
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
