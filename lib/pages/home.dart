import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:root/root.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {

  bool _isRooted = false;

  Future<void> _checkRoot() async {
    bool? isRooted = await Root.isRooted();
    setState(() {
      _isRooted = isRooted!;
    });
  }

  void initState() {
    super.initState();
    _checkRoot();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Root U Check"), centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info), color: Theme.of(context).colorScheme.primary,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text("About Root U Check"),
                  content: const Text("Root U Check is an app that checks if your device is rooted or not. It is made by a A3 Group."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text (
              "Is Your Device Rooted?",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              //border radius
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), //circular border radius
                color: Theme.of(context).colorScheme.primary,
                //color: Colors.grey[200],
              ),
              margin: const EdgeInsets.all(20),
              child: SvgPicture.asset(
                './lib/assets/drawing.svg',
                semanticsLabel: 'Root U Check',
                width: 200,
                height: 200,
              ),
            ),
            IconButton.filled(
              //IconButton size
              iconSize: 50,
              icon: const Icon(Icons.refresh), color: Theme.of(context).colorScheme.primaryContainer, style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary)),
              onPressed: () {
                _checkRoot();
              },
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text (
                _isRooted ? "Your device is Rooted" : "Your Device is not Rooted",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/info');
              },
              child: const Text('Device Info'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/log');
        },
        child: const Icon(Icons.pest_control),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      )
    );
  }
}