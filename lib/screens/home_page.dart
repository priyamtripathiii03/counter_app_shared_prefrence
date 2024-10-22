import 'dart:math';
import 'package:counter_app_shared_prefrence/components/row_count.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app_shared_prefrence/utils/globals.dart';
import 'package:counter_app_shared_prefrence/provider/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderFalse =
        Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(images[homeProviderTrue.index]),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              /// top box -> total count
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 126,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white10,
                              spreadRadius: 2,
                              blurRadius: 2,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  rowCountBox(
                                    title: 'Mala Count :',
                                    isX: true,
                                    text1: '108',
                                    text2:
                                        homeProviderTrue.malaCount.toString(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  rowCountBox(
                                    isX: false,
                                    title: 'Total Count :',
                                    text1:
                                        homeProviderTrue.totalCount.toString(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  rowCountBox(
                                    isX: false,
                                    text1: homeProviderTrue.count.toString(),
                                    title: 'Current Count :',
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const VerticalDivider(),
                              ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.black),
                                ),
                                onPressed: () {
                                  homeProviderFalse.resetCount();
                                },
                                child: const Text(
                                  'reset',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: GestureDetector(
                  onTap: () {
                    homeProviderFalse.countAdd();
                    homeProviderFalse.set(
                      homeProviderTrue.count,
                      homeProviderTrue.totalCount,
                      homeProviderTrue.malaCount,
                      homeProviderTrue.index,
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white12,
                            spreadRadius: 15,
                            blurRadius: 10,
                          ),
                        ]),
                    alignment: Alignment.center,
                    child: Text(
                      homeProviderTrue.count.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              // image controller
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        homeProviderFalse.imageListLeft();
                        homeProviderFalse.set(
                          homeProviderTrue.count,
                          homeProviderTrue.totalCount,
                          homeProviderTrue.malaCount,
                          homeProviderTrue.index,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        homeProviderFalse.imageListRight();
                        homeProviderFalse.set(
                          homeProviderTrue.count,
                          homeProviderTrue.totalCount,
                          homeProviderTrue.malaCount,
                          homeProviderTrue.index,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 35,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
