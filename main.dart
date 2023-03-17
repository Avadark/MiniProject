import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String buttonClick = 'Click';
  int newindex = 0;
  final textclear = TextEditingController();
  final textclear1 = TextEditingController();
  void clearText() {
    textclear.clear();
    textclear1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solo - Trip planner'),
      ),
      body: Center(
        child: newindex == 1 ? Container(
                margin: const EdgeInsets.fromLTRB(15, 80, 15, 15),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                    color: Colors.purpleAccent),
                height: 300,
                width: 280,
                child: Center(
                  child: SizedBox(
                    width: 240,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                            child: Text('Enter the place you want to visit?')),
                        TextField(
                          controller: textclear,
                        ),
                        const Center(
                            child: Text('How Many days do you want to visit?')),
                        TextField(
                          controller: textclear1,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.red,
                                backgroundColor: Colors.amber,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return const SecondPage();
                                }));
                                setState(
                                  () {
                                    buttonClick = 'Submitted';
                                  },
                                );
                              },
                              child: Text(buttonClick),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.red,
                                  backgroundColor: Colors.amber,
                                ),
                                onPressed: clearText,
                                child: const Text('Clear'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                margin: const EdgeInsets.fromLTRB(0, 70, 0, 20),
                child: Column(
                  children: [
                    const SizedBox(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Welcome To Solo-The Trip planner\n\n\n',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Image.network(
                        'https://media.istockphoto.com/id/1221227577/photo/end-of-the-world-street-in-chile-patagonia.jpg?s=612x612&w=0&k=20&c=PamhXMjErITclVZRV7E43je3FPFI7IxhAM-U_2qhR_E=')
                  ],
                ),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Next', icon: Icon(Icons.arrow_forward)),
        ],
        currentIndex: newindex,
        onTap: (int index) {
          setState(() {
            newindex = index;
          });
        },
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attractions'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        scrollDirection: Axis.vertical,
        children: [
                        Image.asset('assets/images/1.png'),
                        Image.asset('assets/images/2.png'),
                        Image.asset('assets/images/3.png'),
                        Image.asset('assets/images/4.png'),
                        Image.asset('assets/images/5.png'),
                        Image.asset('assets/images/6.png'),
                      ]
        // children: List.generate(8, (index) {
        //   return const Padding(
        //       padding: EdgeInsets.all(10),
        //       child: Image(
        //         image: NetworkImage(
        //             'https://img.freepik.com/free-photo/abstract-flowing-neon-wave-background_53876-101942.jpg?w=2000'),
                
        //       ),);
        // },),
      ),
    );
  }
}



