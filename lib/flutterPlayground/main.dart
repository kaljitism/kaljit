import 'package:flutter/material.dart';
import 'package:kaljit/flutterPlayground/provider/parameterProvider.dart';
import 'package:kaljit/flutterPlayground/screens/containerSize.dart';
import 'package:provider/provider.dart';

class FlutterPlayground extends StatelessWidget {
  const FlutterPlayground({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ParameterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const ContainerSize(),
      ),
    );
  }
}
