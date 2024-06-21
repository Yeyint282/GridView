import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          centerTitle: true,
          title: const Text('GirdView Widget'),
          leading: const FlutterLogo(),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2 / 3,
          ),
          itemBuilder: (BuildContext context, int position) {
            return Container(
              padding: const EdgeInsets.all(20),
              // decoration: const BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: [
              //       Colors.lime,
              //       Colors.lightBlue,
              //       Colors.deepOrangeAccent,
              //     ],
              //   ),
              color: Colors.lightBlueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pesron $position'),
                  const Divider(
                    color: Colors.white,
                  ),
                  const Icon(Icons.person),
                  const Divider(
                    color: Colors.white,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showSnackBar(context, 'Person $position');
                    },
                    child: const Text(
                      'Follow',
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }

  // Widget _profile(BuildContext context, int position) {
  //   return ListTile(
  //     leading: const Icon(Icons.person),
  //     title: Text('Person $position'),
  //     subtitle: Text('Address $position'),
  //     trailing: (position % 2 == 0)
  //         ? const Icon(Icons.email)
  //         : const (Icons.person),
  //   );
  // }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
        ),
        action: SnackBarAction(label: 'Undo', onPressed: () {}),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
