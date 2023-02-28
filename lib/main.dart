import 'package:flutter/material.dart';
import 'package:resume/achievement.dart';
import 'package:resume/carrier.dart';
import 'package:resume/contact.dart';
import 'package:resume/declaration.dart';
import 'package:resume/education.dart';
import 'package:resume/interest.dart';
import 'package:resume/menupage.dart';
import 'package:resume/personal.dart';
import 'package:resume/project.dart';
import 'package:resume/references.dart';
import 'package:resume/technical.dart';

import 'experience.dart';
import 'homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const MyApp(),
      'menuPage': (context) => const MenuPage(),
      'Contact': (context) => const ContactInfo(),
      'Career': (context) => const Career(),
      'Personal': (context) => const PersonalInfo(),
      'Education': (context) => const Education(),
      'Experience': (context) => const Experience(),
      'Skills': (context) => const TechnicalSkills(),
      'Interest': (context) => const Interest(),
      'Projects': (context) => const Projects(),
      'Achievements': (context) => const Achievements(),
      'References': (context) => const References(),
      'Declaration': (context) => const Declaration(),
    },
  ));
}
