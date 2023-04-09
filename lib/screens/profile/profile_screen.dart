import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScren extends StatefulWidget {
  const ProfileScren({Key? key}) : super(key: key);

  @override
  State<ProfileScren> createState() => _ProfileScrenState();
}

class _ProfileScrenState extends State<ProfileScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Profile')),
    );
  }
}