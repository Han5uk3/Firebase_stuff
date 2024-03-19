import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/controllers/countroller.dart';
import 'package:untitled2/views/gallery_view.dart';

class Counting extends StatelessWidget {
  const Counting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<countroller>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<countroller>(builder: (context, value, child) {
              return Text("count - ${value.count}",style: TextStyle(color: Colors.white),);
            }),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => galleru(),
                ));
              },
              child: const Text("To Next Page"),
            )
          ],
        ),
      ),
    );
  }
}
