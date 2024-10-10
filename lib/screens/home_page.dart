import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blue.shade50,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/mbac.jpg'),
            )),
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 300),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<HomeProvider>(context, listen: false)
                        .addition();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Colors.grey.shade800,spreadRadius: 5,blurRadius: 15)]),
                    child: Center(
                      child: Text(
                        Provider.of<HomeProvider>(context, listen: true)
                            .counter
                            .toString(),
                        style: const TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              if (Provider.of<HomeProvider>(context, listen: false).counter >
                  0) {
                Provider.of<HomeProvider>(context, listen: false).reset();
              }
            },
            child: const Icon(Icons.restart_alt),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue.shade500,
            onPressed: () {
              Provider.of<HomeProvider>(context, listen: false).addition();
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              if (Provider.of<HomeProvider>(context, listen: false).counter >
                  0) {
                Provider.of<HomeProvider>(context, listen: false).decrement();
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
