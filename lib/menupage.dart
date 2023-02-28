import 'package:flutter/material.dart';

import 'global.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                          flex: 2,
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
                    Text(
                      "Build Options",
                      style: Global.subTitle,
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    myBox(
                        'asset/images/contact.png', 'Contact Info', 'Contact'),
                    myBox('asset/images/briefcase.png', 'Career Objectives',
                        'Career'),
                    myBox('asset/images/person.png', 'Personal Details',
                        'Personal'),
                    myBox(
                        'asset/images/education.png', 'Education', 'Education'),
                    myBox('asset/images/exp.png', 'Experiences', 'Experience'),
                    myBox('asset/images/skills.png', 'Technical Skills',
                        'Skills'),
                    myBox('asset/images/interest.png', 'Interest/Hobbies',
                        'Interest'),
                    myBox('asset/images/project.png', 'Projects', 'Projects'),
                    myBox('asset/images/achievements.png', 'Achievements',
                        'Achievements'),
                    myBox('asset/images/references.png', 'References',
                        'References'),
                    myBox('asset/images/declartion.png', 'Declaration',
                        'Declaration'),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  myBox(String image, String text, String pageKey) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(pageKey);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey.shade200, width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              image,
              height: 30,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            const Spacer(
              flex: 15,
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
