import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StacticScreen extends StatefulWidget {
  const StacticScreen({Key? key}) : super(key: key);

  @override
  State<StacticScreen> createState() => _StacticScreenState();
}

class _StacticScreenState extends State<StacticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset('assets/static.svg',
            
            ),
          ),
          const SizedBox(height: 10,),
          // Text('Sắp có')
        ],
      )
    );

  }
}