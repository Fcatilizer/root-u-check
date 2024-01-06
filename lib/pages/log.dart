import 'dart:io';
import 'package:flutter/material.dart';

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);
  @override
  State<Log> createState() => _Log();
}

//logcat
class _Log extends State<Log> {
  String _logcat = "";
  Future<void> _getLogcat() async {
    ProcessResult result = await Process.run('logcat', ['-d']);
    setState(() {
      _logcat = result.stdout.toString();
    });
  }
  @override
  void initState() {
    super.initState();
    _getLogcat();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logcat"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Text(_logcat),
      ),
    );
  }
}