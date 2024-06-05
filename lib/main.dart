import 'package:flutter/material.dart';
import 'package:gs_oceans/pages/cleanup_detail.dart';
import 'package:gs_oceans/pages/cleanup_list.dart';
import 'package:gs_oceans/pages/gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(
          useMaterial3: true,
        )
        .copyWith(
            primaryColor: Colors.blue,
            appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 1, 40, 60)),
            scaffoldBackgroundColor: const Color.fromARGB(255, 1, 40, 60)),
        routes: {
          '/': (context) => CleanupList(),
          '/second': (context) => CleanupDetail(),
        },
        initialRoute: '/',
        );
        
  }
}
