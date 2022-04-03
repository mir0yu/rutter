import 'package:flutter/material.dart';
import 'package:rutter/constants/locator.dart';
import 'package:rutter/route.dart';

void main() async {
  Paint.enableDithering = true;
  await setupLocator();
  runApp(RutterApp(router: AppRouter()));
}

class RutterApp extends StatelessWidget {
  final AppRouter router;
  const RutterApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        initialRoute: "/auth",
        debugShowCheckedModeBanner: true,
        title: 'Errand',
        theme: ThemeData(
            fontFamily: 'Rubik',
            primaryColor: const Color(0xff7A79CD),
            focusColor: const Color(0xff7A79CD),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: const Color(0xff7A79CD))),
        onGenerateRoute: router.generateRoute,
      );
    }
}