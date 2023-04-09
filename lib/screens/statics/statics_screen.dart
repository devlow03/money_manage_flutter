import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StacticScreen extends StatefulWidget {
  const StacticScreen({Key? key}) : super(key: key);

  @override
  State<StacticScreen> createState() => _StacticScreenState();
}

class _StacticScreenState extends State<StacticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Static"),
      ),
    );

  }
}