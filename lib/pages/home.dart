import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:root/root.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  final Uri tosURL = Uri.parse("https://a3group.co.in/root-u-check/terms-and-service");
  final Uri privacyPolicyURL = Uri.parse("https://a3group.co.in/root-u-check/privacy-policy");

  void showCustomDialogBox() async {
    final ThemeData themeData = Theme.of(context);
    final MaterialLocalizations localizations =
    MaterialLocalizations.of(context);
    const double _textVerticalSeparation = 18.0;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: ListBody(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.tag,
                        size: 50, color: themeData.colorScheme.primary),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: ListBody(
                          children: <Widget>[
                            Text("Root U Check",
                                style: themeData.textTheme.headlineSmall),
                            Text("1.0.0",
                                style: themeData.textTheme.bodyMedium),
                            const SizedBox(height: _textVerticalSeparation),
                            Text('Developed by A3 Group\n\n',
                                style: themeData.textTheme.bodySmall),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                    "This app is developed by A3 Group to check if your device is rooted."),
                const SizedBox(height: 12),
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "You can read our ",
                          style: themeData.textTheme.bodyMedium),
                      TextSpan(
                        text: "Terms and Condition",
                        style: themeData.textTheme.bodyMedium!.copyWith(
                          color: themeData.colorScheme.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                            _launchInBrowser(tosURL);
                          },
                      ),
                      TextSpan(
                          text: " and ", style: themeData.textTheme.bodyMedium),
                      TextSpan(
                        text: "Privacy Policy.",
                        style: themeData.textTheme.bodyMedium!.copyWith(
                          color: themeData.colorScheme.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                            _launchInBrowser(privacyPolicyURL);
                          },
                      ),
                    ])),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text(themeData.useMaterial3
                    ? localizations.closeButtonLabel
                    : localizations.closeButtonLabel.toUpperCase()),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            scrollable: true,
          );
        });
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
              showCustomDialogBox();
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