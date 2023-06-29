import 'package:dart_style/dart_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:kaljit/webPC/Provider/CodeProvider.dart';
import 'package:provider/provider.dart';

class TheCodePage extends StatefulWidget {
  const TheCodePage({super.key});
  @override
  State<TheCodePage> createState() => _TheCodePageState();
}

class _TheCodePageState extends State<TheCodePage> {
  final formatter = DartFormatter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<CodeProvider>(builder: (context, provider, child) {
      return Center(
        child: Container(
          color: Colors.grey,
          child: SyntaxView(
            // syntax view for theme vscodedark
            code: formatter.format(provider.main),
            syntax: Syntax.DART,
            syntaxTheme: SyntaxTheme.vscodeDark(),
            fontSize: 18.0,
            withZoom: true,
            withLinesCount: true,
            expanded: true,
          ),
        ),
      );
    }));
  }
}
