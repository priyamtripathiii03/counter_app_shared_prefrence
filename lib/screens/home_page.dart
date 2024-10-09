import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.red,
                image: DecorationImage(image: AssetImage('assets/mbac.jpg',),fit : BoxFit.cover,),
              ),
        ),
    );
  }
}
