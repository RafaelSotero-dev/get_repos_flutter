import 'package:flutter/material.dart';
import 'package:get_git_repos/app/get_projects.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Scaffold(
          floatingActionButton: FloatingActionButton.small(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.blue,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(title: Center(child: Text(title))),

          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Linha 1', style: TextStyle(color: Colors.black)),
                      Text('Linha 2', style: TextStyle(color: Colors.purple)),
                    ],
                  ),
                  Text('Linha 2', style: TextStyle(color: Colors.green)),
                  Text('Linha 3', style: TextStyle(color: Colors.blue)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.red),

                          child: SizedBox(width: 40, height: 40),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.purple),

                          child: SizedBox(width: 40, height: 40),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: GetRepos()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
