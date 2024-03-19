// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/controllers/img_controller.dart';

class galleru extends StatelessWidget {
  const galleru({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 160),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gallery",
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Provider.of<imgroller>(context, listen: false)
                            .pickimg();
                      },
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey)),
                      child: const Text(
                        "Select images to be shown",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    itemCount: Provider.of<imgroller>(context).pics.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 0.8,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(Provider.of<imgroller>(context)
                                    .pics[index]))),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
