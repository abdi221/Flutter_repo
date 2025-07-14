import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 234, 3, 3)),
      ),
      home: const MyHomePage(title: 'Personal Card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // wireframe for each widget.
          
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
                CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('assets/images/landskape.jpeg'),
              ),
              const SizedBox(height: 32),
              SizedBox(height: 32),

              Text('Abdifataah Abdillahi Ali', 
              style: GoogleFonts.dancingScript(fontSize: 28,
               fontWeight: FontWeight.bold)
              
               ),
               SizedBox(height: 102),

              Card(
                color: const Color.fromARGB(255, 240, 140, 140),
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 20,
                vertical: 16),
                child: Padding(padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Student at Linnaeus University',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),

                      SizedBox(height: 16),
                    
                      Row(
                        children: const [
                          
                          Icon(Icons.email),
                          SizedBox(width: 12),
                          Text(
                            'Email: aa226wu@student.lnu.se', 
                            style:TextStyle(fontSize: 16, fontWeight: FontWeight.normal)
                          )
                        ]
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 12),
                          Text(
                            'Phone: 0701234567',
                            style:TextStyle(fontSize: 16, fontWeight: FontWeight.normal)
                            )
                        ],
                        ),
                        Row(
                          children: [
                          Icon(Icons.web),
                          SizedBox(width: 12),
                          Text(
                            'Website: https://lnu.se/ ',
                            style:TextStyle(fontSize: 16, fontWeight: FontWeight.normal)
                            )
                          ]
                        )


                    ],
                  )
                )),

              ]

           )
        ),
      
    );
  }
}
