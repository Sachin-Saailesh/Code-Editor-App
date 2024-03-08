import 'package:code_editor_app/codeEditorPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/java.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = CodeController(
    text: '//Write your code here...', // Initial code
    language: java,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal[500],
          title: const Text(
            'CODE EDITOR',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Coding Problem:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                        "For this problem, the input is a string of words, and the output should be the words in reverse but with the letters in the original order. For example, the string “Dog bites man” should output as “man bites Dog.”"),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        style: TextStyle(fontWeight: FontWeight.w600),
                        "*Note: Copying code is unethical. Only original work is required. Consequences for plagiarism are severe.")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                child: CodeTheme(
                  data: CodeThemeData(styles: monokaiSublimeTheme),
                  child: CodeField(
                    wrap: false,
                    minLines: 10,
                    controller: controller,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: const Text(
                              style: TextStyle(fontSize: 20),
                              "Are you sure that you want submit this code?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(dialogContext);
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(dialogContext);
                                },
                                child: const Text('No'))
                          ],
                        );
                      });
                },
                child: const Text(
                  "SUBMIT",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
