import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/java.dart';

class CodeEditorPage extends StatefulWidget {
  const CodeEditorPage({super.key});

  @override
  State<CodeEditorPage> createState() => _CodeEditorPageState();
}

class _CodeEditorPageState extends State<CodeEditorPage> {
  final controller = CodeController(
    text: '//Write your code here...', // Initial code
    language: java,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 100, 12, 20),
                child: SingleChildScrollView(
                  child: CodeTheme(
                    data: CodeThemeData(styles: monokaiSublimeTheme),
                    child: CodeField(
                      wrap: false,
                      minLines: 10,
                      controller: controller,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
